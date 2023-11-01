#' Get Draft Kings Data
#'
#' Fetch DraftKings data
#' in parallel using Packet Stream proxies by default.
#'
#' @inheritParams furrr::future_map
#' @inheritParams dk_request_process
#' @param func A function from the `draft.kings` package.
#' @param keys This is passed as the first argument to `func`.
#' @param retry_options List of arguments passed to `httr2::req_retry()`.
#'   If `NULL` (the default), `max_tries` is set to 5 and these status codes are considered
#'   transient: 429, 500, 503, 408, 400.
#' @param proxy_args List of arguments to `httr2::req_proxy`.
#'   If `NULL` (the default), this argument will look for environmental variables
#'   related to PacketStream. See details section for which environmental variables should
#'   be set.
#' @param furrr_options Options passed to `furrr::furrr_options`.
#'   If `NULL` (the default), then will use `seed` and `stdout` to `TRUE`, and ensure
#'   required packages are passed to the workers.
#' @param report_time Should the time it took the function to complete be reported?
#' @param ... Other arguments passed to underlying `draft.kings` function (`func`)
#'
#' @details
#'
#' If `proxy_args` is `TRUE`, then the following environmental variables should be set:
#'
#' PACKET_STREAM_URL
#' PACKET_STREAM_PORT
#' PACKET_STREAM_USER
#' PACKET_STREAM_PASS
#'
#' @export
dk_get <- function(func,
                   keys,
                   output = c("all", "cleaned_json", "json", "response", "request"),
                   retry_options = NULL,
                   proxy_args = NULL,
                   report_time = TRUE,
                   .progress = TRUE,
                   furrr_options = NULL,
                   ...) {

  output <- rlang::arg_match(output)

  # Set retry options if not passed
  if (is.null(retry_options)) {
    retry_options <- list(
      max_tries = 5,
      is_transient = ~httr2::resp_status(.x) %in% c(429, 500, 503, 408, 400, 404)
    )
  }

  # Set proxy args if not passed
  if (is.null(proxy_args)) {
    proxy_args <- list(
      url = Sys.getenv('PACKET_STREAM_URL'),
      port = as.numeric(Sys.getenv('PACKET_STREAM_PORT')),
      username = Sys.getenv('PACKET_STREAM_USER'),
      password = paste0(Sys.getenv('PACKET_STREAM_PASS'), "_country-UnitedStates"),
      auth = "basic"
    )
  }

  if (is.null(furrr_options)) {
    furrr_options <- list(stdout = TRUE,
                          seed = TRUE,
                          packages = c("dplyr", "draft.kings", "cli"))
  }

  start_time <- Sys.time()

  out <- withCallingHandlers(
    # Need suppressPackageStartupMessages() because furrr_options(packages = ...)
    expr = suppressPackageStartupMessages(furrr::future_map_dfr(
      .progress = .progress,
      .options = do.call(furrr::furrr_options, furrr_options),
      keys,
      function(.key) {

        resp <- NULL

        resp <- tryCatch(
          expr = {

            out <- func(
              .key,
              output = if (output == "all") "response" else output,
              retry_options = retry_options,
              proxy_args = proxy_args,
              ...
            )

            if (output == "all") {

              out <- dplyr::tibble(
                key = .key,
                request = list(httr2::last_request()),
                response = list(out),
                json = list(httr2::resp_body_json(out)),
                cleaned_json = list(draft.kings::dk_resp_parse(out)),
                status = out$status_code,
                error_message = as.character(NA),
                error_output = list(NULL)
              )

            } else {

              out <- dplyr::tibble(
                key = .key,
                !!output := list(out),
                status = out$status_code,
                error_message = as.character(NA),
                error_output = list(NULL)
              )

            }

            out

          },

          error = function(error) {

            error

          }

        )

        if (inherits(resp, "error")) {

          resp <- dplyr::tibble(
            key = .key,
            response = list(resp$resp),
            error_output = list(resp),
            error_message = resp$message,
            status = resp$resp$status
          )

          if (output == "all") {
            resp <- resp |>
              dplyr::mutate(
                request = list(httr2::last_request())
              ) |>
              dplyr::relocate("request", .before = "response")
          }

        }


        resp

      }
    )),
    warning = function(w) {

    }
  )

  status_200_count <- sum(out$status == 200, na.rm = TRUE)
  total <- length(out$status)
  non_200_status_count <- total - status_200_count
  pct_total <- round(non_200_status_count / total * 100, 1)

  if (non_200_status_count > 0) {

    cli::cli_warn(
      "{non_200_status_count} of {total} request{?s} ({pct_total}%) did not have a 200 status code"
    )
  }

  if (report_time) pretty_duration(start_time, prefix = "Total time")

  out

}
