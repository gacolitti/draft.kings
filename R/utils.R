#' Clean table or vector of names
#'
#' @return Returns vector if vector or data.frame if data.frame.
#' @param .data Data.frame or vector of column names.
#' @param unique Should the variable names be unique?
#' @param minus_to_underscore By default `-` is replaced with `minus`.
#'   This argument replaces the hyphen with `_` (underscore) instead.
#'
#' @export
clean_names <- function(.data,
                        unique = FALSE,
                        minus_to_underscore = FALSE) {

  n <- if (is.data.frame(.data)) colnames(.data) else .data

  # If Non-ASCII characters found, return original strings
  if (any(grepl("[^ -~]", n))) {
    warning("Found non-ASCII characters. Returning original names...", call. = FALSE)
    return(n)
  }

  n <- gsub("%+", "_per_", n)
  n <- gsub("\\$+", "_dollars_", n)
  n <- gsub("\\++", "_plus_", n)

  if (minus_to_underscore) {
    n <- gsub("-+", "_", n)
  } else {
    n <- gsub("-+", "_minus_", n)
  }

  n <- gsub("\\*+", "_star_", n)
  n <- gsub("#+", "_cnt_", n)
  n <- gsub("&+", "_and_", n)
  n <- gsub("@+", "_at_", n)


  n <- gsub("[^a-zA-Z0-9_]+", "_", n)
  n <- gsub("([A-Z][a-z])", "_\\1", n)
  n <- tolower(trimws(n))
  n <- gsub("(^_+|_+$)", "", n)
  n <- gsub("_+", "_", n)

  if (unique) n <- make.unique(n, sep = "_")

  if (is.data.frame(.data)) {
    colnames(.data) <- n
    .data
  } else {
    n
  }
}

#' Returns the error message from a response
#'
#' @param resp list, expects output from a call to a Mosaic API endpoint
#'
#' @noRd
#' @keywords internal
get_error_body <- function(resp) {

  if (httr2::resp_content_type(resp) == "application/json") {

    resp_body <- httr2::resp_body_json(resp)
    paste0(
      tools::toTitleCase(gsub("_", " ", (resp_body$errorType))),
      "\n",
      resp_body$error
    )

  } else if (httr2::resp_content_type(resp) == "text/html") {

    httr2::resp_body_html(resp)

  }

}

#' Add Proxy Args
#'
#' Add list of arguments for `httr2::req_proxy` to a request object
#'
#' @inheritParams httr2::req_proxy
#' @param proxy_args List of arguments to `httr2::req_proxy`
#'
add_proxy <- function(req, proxy_args) {

  if (!is.null(proxy_args)) {

    req <- do.call(httr2::req_proxy, args = c(proxy_args, list(req = req)))

  }

  req

}

#' Add Options
#'
#' Add list of arguments for `httr2::req_options` to a request object
#'
#' @inheritParams httr2::req_options
#' @param options List of arguments to `httr2::req_options`
#'
add_curl_options <- function(req, curl_options) {

  if (!is.null(curl_options)) {

    req <- do.call(httr2::req_options, args = c(curl_options, list(.req = req)))

  }

  req

}

#' Add Throttle
#'
#' Add list of arguments for `httr2::req_throttle` to a request object
#'
#' @inheritParams httr2::req_throttle
#' @param throttle_rate List of arguments to `httr2::req_throttle`
#'
add_throttle <- function(req, throttle_rate) {

  if (!is.null(throttle_rate)) {

    req <- do.call(httr2::req_throttle, args = c(throttle_rate, list(req = req)))

  }

  req

}

#' Add Headers
#'
#' Add list of arguments for `httr2::req_headers` to a request object
#'
#' @inheritParams httr2::req_throttle
#' @param headers List of arguments to `httr2::req_headers`
#'
add_headers <- function(req, headers) {

  if (!is.null(headers)) {

    req <- do.call(httr2::req_headers, args = c(headers, list(.req = req)))

  }

  req

}

#' Add Retry
#'
#' Add list of arguments for `httr2::req_retry` to a request object
#'
#' @inheritParams httr2::req_retry
#' @param headers List of arguments to `httr2::req_retry`
#'
add_retry <- function(req, options) {

  if (!is.null(options)) {

    req <- do.call(httr2::req_retry, args = c(options, list(req = req)))

  }

  req

}

#' Process Request Based on Output Argument
#'
#' @inheritParams add_retry
#'
#' @param output One of "cleaned_json" (the default),
#'   "json", "response", or "request". If "cleaned_json" then `tidyjson::spread_all` is used
#'   to parse the JSON body,
dkreq_process <- function(req, output) {

  if (output == "request") {

    return(req)

  } else {

    resp <- httr2::req_perform(req)

  }


  if (output == "response") {

    return(resp)

  } else {

    resp_json <-  httr2::resp_body_json(resp)

  }

  if (output == "json") {

    return(resp_json)

  } else {

    resp_json_clean <- tidyjson::spread_all(resp_json) %>%
      dplyr::as_tibble() %>%
      dplyr::select(-document.id) %>%
      tidyr::drop_na() %>%
      clean_names()

    return(resp_json_clean)

  }

}

