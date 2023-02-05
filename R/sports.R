
#' Get Sports
#'
#' Fetch list of sport names and IDs.
#'
#' @inheritParams dk_request_process
#'
#' @param ... Arguments passed to [draft.kings::dk_request()]
#'
#' @examples
#'   \dontrun{
#'     dk_get_sports()
#'   }
#'
#' @export
dk_get_sports <- function(output = c("cleaned_json", "json", "response", "request"),
                        ...) {

  output <- rlang::arg_match(output)

  req <- dk_request(
    ...,
    paths = glue::glue("sites/US-DK/sports/v1/sports"),
    query_params = list(format = "json")
  )

  dk_request_process(req, output, objclass = "sports_resp")

}
