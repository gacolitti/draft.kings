#' Add Proxy Args
#'
#' Add list of proxy arguments to a request object
#'
#' @inheritParams httr2::req_proxy
#' @param proxy_args List of arguments to [httr2::req_proxy]
#'
add_proxy <- function(req, proxy_args) {

  if (!is.null(proxy_args)) {

    req <- do.call(httr2::req_proxy, args = c(proxy_args, list(req = req)))

  }

  req

}

#' Add Curl Options
#'
#' Add list of curl arguments to a request object
#'
#' @inheritParams httr2::req_options
#' @param options List of arguments to [httr2::req_options]
#'
add_curl_options <- function(req, curl_options) {

  if (!is.null(curl_options)) {

    req <- do.call(httr2::req_options, args = c(curl_options, list(.req = req)))

  }

  req

}

#' Add Throttle
#'
#' Add list of throttle arguments to a request object
#'
#' @inheritParams httr2::req_throttle
#' @param throttle_rate List of arguments to [httr2::req_throttle]
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
#' @param headers List of arguments to [httr2::req_headers()]
#'
add_headers <- function(req, headers) {

  if (!is.null(headers)) {

    req <- do.call(httr2::req_headers, args = c(headers, list(.req = req)))

  }

  req

}

#' Add Retry
#'
#' Add list of arguments to a request object that control when a request is retried
#'
#' @inheritParams httr2::req_retry
#' @param retry_options List of arguments passed to [httr2::req_retry()]
#'
add_retry <- function(req, retry_options) {

  if (!is.null(retry_options)) {

    req <- do.call(httr2::req_retry, args = c(retry_options, list(req = req)))

  }

  req

}


#' Add Error Handling
#'
#' Add list of arguments to a request object that when errors occur and how the message is
#' extracted.
#'
#' @inheritParams httr2::req_error
#' @param headers List of arguments to [httr2::req_error()]
#'
add_error_handling <- function(req, error_handling_options = NULL) {

  if (is.null(error_handling_options)) {

    error_handling_options <- list(body = get_error_body)

  }

  do.call(httr2::req_error, args = c(error_handling_options, list(req = req)))

}



#' Add To URL Path
#'
#' @inheritParams httr2::req_url_path_append
#' @param paths List of arguments to [httr2::req_url_path_append()]
#'
add_to_path <- function(req, paths) {

  if (!is.null(paths)) {

    req <- do.call(httr2::req_url_path_append, args = c(paths, list(req = req)))

  }

  req

}
