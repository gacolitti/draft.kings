
#' Get Contest Info
#'
#' Fetch contest information such as the sport, payout, and contest summary.
#'
#' @inheritParams dk_req_process
#' @inheritDotParams dk_req
#'
#' @param contest_key The sequence of digits that correspond to a specific contest.
#'   This can be found by examining the URL of a contest page.
#'   For example: \url{https://www.draftkings.com/draft/contest/133645678#}. Here the contest ID
#'   is 133645678.
#' @param process_args Optional list of arguments passed to `dk_req_process`
#'
#' @examples
#'   \dontrun{
#'     dk_get_contest_info(133645678)
#'   }
#'
#' @export
dk_get_contest_info <- function(contest_key,
                                output = c("cleaned_json", "json", "response", "request"),
                                process_args = NULL,
                                ...) {

  stopifnot(is.numeric(contest_key))
  output <- rlang::arg_match(output)

  req <- dk_req(
    ...,
    paths = glue::glue("contests/v1/contests/{contest_key}"),
    query_params = list(format = "json")
  )

  process_args <- c(list(req = req, output = output, objclass = "contest_info_resp"), process_args)

  do.call(dk_req_process, process_args)

}

#' Get List of Contests in Lobby
#'
#' Fetch the full table of contests and related info from DraftKings.com lobby
#'
#' @inheritParams dk_req_process
#' @inheritParams dk_get_contest_info
#' @inheritDotParams dk_req
#'
#' @param sport character. optional.
#'
#' @export
dk_get_lobby_contests <- function(sport = NULL,
                         output = c("cleaned_json", "json", "response", "request"),
                         process_args = NULL,
                         ...) {

  output <- rlang::arg_match(output)

  req <- dk_req(
    ...,
    base_url = "https://www.draftkings.com/",
    paths = "lobby/getcontests",
    query_params = list(sport = sport)
  )

  process_args <- c(list(req = req, output = output, objclass = "lobby_contests_resp"),
                    process_args)

  do.call(dk_req_process, process_args)

}

#' Get Gametype Rules
#'
#' Fetch rules corresponding to a specific game type ID.
#'
#' @inheritParams dk_req_process
#' @inheritParams dk_get_contest_info
#' @inheritDotParams dk_req
#'
#' @param game_type_id Integer corresponding to the game type.
#'   For example, 159 in \url{https://api.draftkings.com/lineups/v1/gametypes/159/rules}.
#'   If both `game_type_id` and `contest_key` are passed, then `contest_key` is ignored.
#'
#' @export
dk_get_game_type_rules <- function(game_type_id = NULL,
                               contest_key = NULL,
                               output = c("cleaned_json", "json", "response", "request"),
                               process_args = NULL,
                               ...) {

  output <- rlang::arg_match(output)

  if (all(is.null(game_type_id), is.null(contest_key))) {

    cli::cli_abort(
      "`game_type_id` and `contest_key` cannot both be missing"
    )

  }

  if (is.null(game_type_id)) {

    game_type_id <- dk_get_contest_info(contest_key)$game_type_id

  }

  req <- dk_req(
    ...,
    paths = glue::glue("lineups/v1/gametypes/{game_type_id}/rules")
  )

  process_args <- c(list(req = req, output = output, objclass = "game_type_rules_resp"),
                    process_args)

  do.call(dk_req_process, process_args)

}

#' Get List of Game Types in Lobby
#'
#' Fetch the full list of game types
#'
#' @inheritParams dk_get_lobby_contests
#' @inheritDotParams dk_req
#'
#' @export
dk_get_lobby_game_types <- function(sport = NULL,
                             output = c("cleaned_json", "json", "response", "request"),
                             process_args = NULL,
                             ...) {

  output <- rlang::arg_match(output)

  req <- dk_req(
    ...,
    base_url = "https://www.draftkings.com/",
    paths = "lobby/getcontests",
    query_params = list(sport = sport)
  )


  process_args <- c(list(req = req, output = output, objclass = "lobby_game_types_resp"),
                    process_args)

  do.call(dk_req_process, process_args)

}
