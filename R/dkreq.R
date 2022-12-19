
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
dkreq <- function(proxy_args = NULL,
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

