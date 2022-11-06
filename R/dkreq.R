
dkreq <- function(req,
                  proxy_args = NULL,
                  curl_options = NULL,
                  throttle_rate = NULL,
                  headers = NULL,
                  retry_options = NULL,
                  is_error_func = NULL,
                  error_body_func = get_error_body,
                  base_url = "https://api.draftkings.com/") {

  req <- httr2::request(base_url)
  req <- add_proxy(req, proxy_args)
  req <- add_curl_options(req, curl_options)
  req <- add_throttle(req, throttle_rate)
  req <- add_headers(req, headers)
  req <- add_retry(req, retry_options)
  req <- httr2::req_error(req, body = error_body_func, is_error = is_error_func)

  req

}

