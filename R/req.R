
#' Create Draft Kings Request Object
#'
#' @inheritParams add_proxy
#' @inheritParams add_curl_options
#' @inheritParams add_throttle
#' @inheritParams add_headers
#' @inheritParams add_to_path
#' @inheritParams add_error_handling
#' @inheritParams add_retry
#' @inheritParams httr2::req_error
#' @inheritParams httr2::request
#'
#' @param query_params A list of query parameters passed to `[httr2::req_url_query]`.
#'
#' @export
dk_request <- function(proxy_args = NULL,
                  curl_options = NULL,
                  throttle_rate = NULL,
                  headers = NULL,
                  paths = NULL,
                  query_params = NULL,
                  retry_options = NULL,
                  error_handling_options = NULL,
                  base_url = "https://api.draftkings.com/"
                  ) {

  req <- httr2::request(base_url)
  req <- add_proxy(req, proxy_args)
  req <- add_curl_options(req, curl_options)
  req <- add_throttle(req, throttle_rate)
  req <- add_headers(req, headers)
  req <- add_retry(req, retry_options)
  req <- add_error_handling(req, error_handling_options)
  req <- add_to_path(req, paths)
  req <- httr2::req_url_query(req, !!! query_params)

  req

}

#' Process Draft Kings Request Object
#'
#' Wrapper to facilitate how a request should
#' be processed based on a desired output.
#'
#' @inheritParams dk_req_perform
#' @inheritParams httr2::request
#'
#' @param output One of "cleaned_json" (the default),
#'   "json", "response", or "request". If "cleaned_json" then [tidyjson::spread_all()] is used
#'   to parse the JSON body,
#'
#' @return See `output`.
#' @export
#'
dk_request_process <- function(req,
                               output = c("cleaned_json", "json", "response", "request"),
                               objclass = NULL) {

  output <- rlang::arg_match(output)

  if (output == "request") {

    return(req)

  }

  if (output == "response") {

    out <- dk_req_perform(req, output = "response", objclass = objclass)

  } else {

    out <- dk_req_perform(req, output = "json", objclass = objclass)

  }

  if (output == "cleaned_json") {

    out <- dk_resp_parse(out)

  }

  out

}

