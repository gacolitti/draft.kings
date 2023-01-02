
#' Get Leaderboard
#'
#' Fetch leaderboard for a contest. A leaderboard
#' contains a list of entries in a contest,
#' fantasy points for each entry, associated user
#' for each entry, rank, and winnings.
#'
#' @inheritParams dk_request_process
#' @inheritParams get_contest_info
#' @inheritDotParams get_contest_info
#'
#' @examples
#'   \dontrun{
#'     dk_get_leaderboard(133645678)
#'   }
#'
#' @export
dk_get_leaderboard <- function(contest_id,
                               cookiefile = "cookies.txt",
                               output = c("cleaned_json", "json", "response", "request"),
                               ...) {

  output <- rlang::arg_match(output)

  req <- dk_request(
    ...,
    paths = glue::glue("scores/v1/leaderboards/{contest_id}"),
    query_params = list(
      "format" = "json",
      "embed" = "leaderboard"
    ),
    curl_options = list(
      "cookiefile" = cookiefile
    )
  )

  dk_request_process(req, output, objclass = "leaderboard_resp")

}
