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
add_options <- function(req, options) {

  if (!is.null(options)) {

    req <- do.call(httr2::req_options, args = c(options, list(req = req)))

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

