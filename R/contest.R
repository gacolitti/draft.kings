
#' Get Contest Info
#'
#' Fetch contest information such as the sport, payout, and contest summary.
#'
#' @inheritParams dk_request
#' @inheritParams dk_request_process
#'
#' @param contest_id The sequence of digits that correspond to a specific contest.
#'   This can be found by examining the URL of a contest page.
#'   For example: \url{https://www.draftkings.com/draft/contest/133645678#}. Here the contest ID
#'   is 133645678.
#' @param ... Arguments passed to [draft.kings::dk_request()]
#'
#' @examples
#'   \dontrun{
#'     get_contest_info(133645678)
#'   }
#'
#' @export
get_contest_info <- function(contest_id,
                             output = c("cleaned_json", "json", "response", "request"),
                             ...) {

  stopifnot(is.numeric(contest_id))
  output <- match.arg(output)

  req <- dk_request(
    ...,
    paths = glue::glue("contests/v1/contests/{contest_id}"),
    query_params = list(format = "json")
  )

  dk_request_process(req, output, objclass = "contest_info_resp")

}

#' Get List of Contests
#'
#' Fetch the full table of contests and related info from DraftKings.com lobby
#'
#' @inheritParams dk_request
#' @inheritParams dk_request_process
#'
#' @param sport character. optional.
#' @param ... Arguments passed to [draft.kings::dk_request()]
#'
#' @export
get_contests <- function(sport = NULL,
                         output = c("cleaned_json", "json", "response", "request"),
                         ...) {

  output <- match.arg(output)

  req <- dk_request(
    ...,
    base_url = "https://www.draftkings.com/",
    paths = "lobby/getcontests",
    query_params = list(sport = sport)
  )

  dk_request_process(req, output, objclass = "contests_resp")

}

#' Get Gametype Rules
#'
#' Fetch rules corresponding to a specific game type ID.
#'
#' @inheritParams dk_request
#' @inheritParams dk_request_process
#' @inheritParams get_contest_info
#'
#' @param game_type_id Integer corresponding to the game type.
#'   For example, 159 in \url{https://api.draftkings.com/lineups/v1/gametypes/159/rules}.
#'   If both `game_type_id` and `contest_id` are passed, then `contest_id` is ignored.
#' @param ... Arguments passed to [draft.kings::dk_request()]
#'
#' @export
get_gametype_rules <- function(game_type_id = NULL,
                               contest_id = NULL,
                               output = c("cleaned_json", "json", "response", "request"),
                               ...) {

  output <- match.arg(output)

  if (all(is.null(game_type_id), is.null(contest_id))) {

    cli::cli_abort(
      "`game_type_id` and `contest_id` cannot both be missing"
    )

  }

  if (is.null(game_type_id)) {

    game_type_id <- get_contest_info(contest_id)$game_type_id

  }

  req <- dk_request(...,
                    paths = glue::glue("lineups/v1/gametypes/{game_type_id}/rules"))

  dk_request_process(req, output, objclass = "gametype_rules_resp")

}

