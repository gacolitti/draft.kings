
#' Get Sports
#'
#' Fetch list of sport names and IDs.
#'
#' @inheritParams dk_request_process
#' @inheritParams dk_get_contest_info
#'
#' @inheritDotParams dk_request
#'
#' @examples
#'   \dontrun{
#'     dk_get_sports()
#'   }
#'
#' @export
dk_get_sports <- function(output = c("cleaned_json", "json", "response", "request"),
                          process_args = NULL,
                          ...) {

  output <- rlang::arg_match(output)

  req <- dk_request(
    ...,
    paths = glue::glue("sites/US-DK/sports/v1/sports"),
    query_params = list(format = "json")
  )

  process_args <- c(list(req = req, output = output, objclass = "sports_resp"),
                    process_args)

  do.call(dk_request_process, process_args)

}
