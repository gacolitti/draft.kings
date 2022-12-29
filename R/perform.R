
#' Perform Draft Kings API Request
#'
#' Wrapper around [httr2::req_perform()] that
#' sends API request and fetches response body.
#' Also, adds relevant object class for use with
#' parsing functions; See [draft.kings::dk_resp_parse()].
#'
#' @inheritParams httr2::req_perform
#'
#' @param output One of 'json' or 'response'.
#' @param objclass character. Name of class to assign to output object. Default
#'   is NULL, and no additional class is assigned. Used to facilitate parsing;
#'   See [draft.kings::dk_resp_parse()].
#'
#' @export
dk_req_perform <- function(req,
                           path = NULL,
                           verbosity = NULL,
                           mock = getOption("httr2_mock", NULL),
                           output = c("json", "response"),
                           objclass = NULL) {


  output <- rlang::arg_match(output)

  resp <- httr2::req_perform(req,
                             path = path,
                             verbosity = verbosity,
                             mock = mock)

  if (output == "json") {

    out <- httr2::resp_body_json(resp)
    class(out) <- c("dk_resp_json", class(out))

  } else {

    out <- resp
    class(out) <- c("dk_resp", class(out))

  }

  if (!is.null(objclass)) {

    class(out) <- c(objclass, class(out))

  }

  out

}
