
#' Get Competitions for a Draft Group
#'
#' Fetch information on the competitions associated with a specific
#' draft group ID. In particular, this includes home/away team designation,
#' team IDs, and sport name.
#'
#' @inheritParams dk_get_contest_info
#' @inheritDotParams dk_request
#'
#' @param draft_group_id Sequence of digits that correspond to a draft table/group.
#'
#' @examples
#'   \dontrun{
#'     # NFL Showdown Captain Mode
#'     dk_get_competitions(75284)
#'
#'     # NFL Classic
#'     dk_get_competitions(74625)
#'
#'     # Multiple competitions
#'     dk_get_competition(42994)
#'   }
#'
#' @export
dk_get_competitions <- function(draft_group_id = NULL,
                               output = c("cleaned_json", "json", "response", "request"),
                               ...) {

  output <- rlang::arg_match(output)

  req <- dk_request(
    ...,
    paths = glue::glue(
      "sports/v1/competitions?draftGroupId={draft_group_id}&format=json"
    )
  )

  dk_request_process(req, output, objclass = "competitions_resp")

}
