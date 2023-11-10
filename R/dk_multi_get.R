
#' Perform multiple requests in parallel
#'
#' @description `multi_req_perform2` performs multiple HTTP requests concurrently
#' and optionally retries failed attempts.
#'
#' @inheritParams httr2::multi_req_perform
#'
#' @param retry_sleep A numeric value indicating the number of seconds to sleep
#'   after performing the requests. If NULL or negative, no sleep is performed.
#' @param max_tries Maximum number of retry attempts for responses that are flagged as
#'   transient with the `is_transient` function. By default, will retry 1 time.
#' @param is_transient A predicate function that takes a single argument (the response) and
#'   returns TRUE or FALSE specifying whether or not the response represents a transient error.
#'   By default, requests with a 429, 503, or 403 status code are treated as transient,
#'   as well as requests that completely failed and returned no status code.
#' @param verbose Should messages related to retry logic be reported?
#' @param ... Other arguments passed to [httr2::multi_req_perform()]
#'
#' @details
#' This function is a wrapper around [httr2::multi_req_perform()] that allows for
#' the introduction of retry logic if some requests meet user-defined criteria.
#' This can be useful for sending many requests that are likely to encounter transient
#' errors that can be resolved with additional attempts.
#'
#' @return A list of responses from [httr2::multi_req_perform()].
#'
#' @examples
#' \dontrun{
#' req_list <- list(
#'   httr2::request("http://httpbin.org/get"),
#'   httr2::request("http://httpbin.org/get")
#' )
#' responses <- multi_req_perform2(req_list, retry_sleep = 2)
#' }
#'
#' @keywords internal
#'
multi_req_perform2 <- function(reqs, max_tries = 1, retry_sleep = 3, is_transient = NULL,
                               paths = NULL, verbose = FALSE, ...) {

  if (!is.numeric(retry_sleep) || retry_sleep < 0) {
    stop("`retry_sleep` should be a non-negative numeric value.")
  }

  if (!is.numeric(max_tries) || max_tries <= 0) {
    stop("`max_tries` should be a positive integer.")
  }

  if (!is.null(is_transient) && !is.function(is_transient)) {
    stop("`is_transient` should be a function.")
  }

  if (is.null(is_transient)) {
    is_transient <- function(resp) {
      is.null(resp) || "httr2_failed" %in% class(resp) || resp$status %in% c(429, 503, 403)
    }
  }

  out <- httr2::multi_req_perform(reqs, paths = paths, ...)

  try_count <- 1

  # Check if any requests need to be retried
  retry_indices <- sapply(out, function(resp) isTRUE(is_transient(resp)))
  success <- all(!retry_indices)

  while (!success && try_count <= max_tries) {

    if (verbose) {
      cli::cli_inform(
        paste(
          "Retrying {sum(retry_indices)} unsuccessful request{?s}.",
          "Attempt {try_count} of {max_tries}"
        )
      )
    }

    # Sleep only if not the first try
    if (try_count > 1 && retry_sleep > 0) {
      Sys.sleep(retry_sleep)
    }

    # Prepare the requests that need to be retried
    retry_reqs <- reqs[retry_indices]

    # Perform the requests
    retry_out <- httr2::multi_req_perform(retry_reqs, paths = paths[retry_indices], ...)

    # Update the original output with the new results
    out[retry_indices] <- retry_out

    try_count <- try_count + 1

    # Check if any requests need to be retried
    retry_indices <- sapply(out, function(resp) isTRUE(is_transient(resp)))
    success <- all(!retry_indices)
  }

  if (!success) {
    # Warn when max_tries were reached but some requests still failed
    failed_pct <- paste0(round(100 * sum(retry_indices) / length(out)), "%")
    cli::cli_warn(
      paste(
        "{sum(retry_indices)} of {length(out)} request{?s} ({failed_pct})",
        "failed after {max_tries} attempts."
      )
    )
  }

  out
}


#' Chunk a vector into a specified number of chunks or a specified chunk size
#'
#' @param x A vector or other R object that can be split.
#' @param n_chunks An optional integer indicating the desired number of chunks.
#' @param chunk_size An optional integer indicating the desired number of elements per chunk.
#'
#' @details
#' This function splits the input `x` into multiple chunks based on the specified
#' `n_chunks` or `chunk_size`. If both are provided, `chunk_size` takes precedence
#' and `n_chunks` is ignored with a warning. If neither is provided, the function
#' will stop with an error. The function returns a list of chunks.
#'
#' @return A list of chunks.
#'
#' @examples
#' \dontrun{
#' vec <- 1:10
#' chunk(vec, chunk_size = 3)
#' chunk(vec, n_chunks = 3)
#' }
#'
#' @keywords internal
#'
chunk <- function(x, n_chunks = NULL, chunk_size = NULL) {

  if (is.null(n_chunks) && is.null(chunk_size)) {
    stop("Both `n_chunks` and `chunk_size` cannot be NULL.")
  }

  if (!is.null(n_chunks) && !is.null(chunk_size)) {
    warning(
      paste("Both `n_chunks` and `chunk_size` were specified.",
            "Only `chunk_size` will be used.")
    )
    n_chunks <- NULL
  }

  if (!is.null(chunk_size)) {

    if (chunk_size <= 0) {
      stop("`chunk_size` must be a positive integer.")
    }

    # Warn if chunk_size is greater than the length of x
    if (chunk_size > length(x)) {
      warning(
        paste("`chunk_size` is greater than the length of `x`.",
              "This will result in fewer chunks than expected.")
      )
    }

    groups <- ceiling(seq_along(x) / chunk_size)
    out <- split(x, groups)

  } else {

    if (n_chunks <= 0) {
      stop("`n_chunks` must be a positive integer.")
    }

    # Warn if n_chunks is greater than the length of x
    if (n_chunks > length(x)) {
      warning(
        paste("`n_chunks` is greater than the length of `x`.",
              "This will result in fewer chunks than expected.")
      )
      n_chunks <- length(x)
    }

    # Don't try to break x if n_chunks is set to 1
    if (n_chunks == 1) {
      out <- list(x)
    } else {
      groups <- cut(seq_along(x), n_chunks, labels = FALSE)
      out <- split(x, groups)
    }

  }

  out
}


#' Get Draft Kings Data in Parallel
#'
#' Fetch DraftKings data in parallel using `httr2::multi_req_perform()`
#' with retry logic and in batches.
#'
#' @inheritParams dk_request_process
#' @inheritParams chunk
#' @inheritParams multi_req_perform2
#' @inheritParams purrr::map
#'
#' @param chunk_size,n_chunks Arguments passed to [chunk()].
#'   By default, `reqs` is not batched into chunks.
#' @param batch_sleep Delay in seconds between batches defined by `chunk_size` or `n_chunks`.
#' @param retry_sleep Delay in seconds between retries. See [multi_req_perform2()] for details.
#' @param report_time Should the time it took the function to complete be reported?
#' @param ... Other arguments passed to [multi_req_perform2()].
#'
#' @return A list of `httr2` response objects returned by [httr2::multi_req_perform()]
#'
#' @export
dk_multi_get <- function(reqs,
                         paths = NULL,
                         chunk_size = NULL,
                         n_chunks = NULL,
                         batch_sleep = 3,
                         retry_sleep = 3,
                         report_time = TRUE,
                         .progress = TRUE,
                         ...) {

  if (!is.numeric(batch_sleep) || batch_sleep < 0) {
    stop(sprintf("`batch_sleep` should be a non-negative numeric value. Received: %s", batch_sleep))
  }

  if (!is.numeric(retry_sleep) || retry_sleep < 0) {
    stop(sprintf("`retry_sleep` should be a non-negative numeric value. Received: %s", retry_sleep))
  }

  # Check if the length of `paths` matches the length of `reqs`
  if (!is.null(paths) && length(paths) != length(reqs)) {
    stop(sprintf("The length of `paths` should match the length of `reqs`. Length of `paths`: %s, Length of `reqs`: %s", length(paths), length(reqs)))
  }

  # Don't use batching if neither chunk_size or n_chunks are passed
  if (is.null(chunk_size) && is.null(n_chunks)) {
    n_chunks <- 1
  }

  start_time <- Sys.time()

  request_batches <- chunk(reqs,
                           n_chunks = n_chunks,
                           chunk_size = chunk_size)

  if (!is.null(paths)) {
    path_batches <- chunk(paths,
                          n_chunks = n_chunks,
                          chunk_size = chunk_size)

  } else {
    path_batches <- list(NULL)
  }

  # Loop over batches
  responses_lst <- purrr::map2(
    .progress = .progress,
    request_batches,
    path_batches,
    \(reqs, paths) {

      out <- multi_req_perform2(reqs, retry_sleep = retry_sleep, paths = paths, ...)

      # Only sleep if there is more than one batch
      if (length(request_batches) > 1) Sys.sleep(batch_sleep)

      out
    }
  )

  # Combine batches of responses into a single list
  out <- do.call("c", responses_lst)

  if (report_time) pretty_duration(start_time, prefix = "Total time")

  out

}
