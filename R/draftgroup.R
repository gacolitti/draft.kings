
#' Check Draft Group Inputs
#'
#' Use either `draft_group_id` or `contest_key` if `draft_group_id` is `NULL`.
#' @inheritParams dk_get_draft_group
#' @keywords internal
check_draft_group_id <- function(draft_group_id = NULL, contest_key = NULL) {

  # Ensure at least one argument is passed
  if (all(is.null(draft_group_id), is.null(contest_key))) {

    cli::cli_abort(
      "`draft_group_id` and `contest_key` cannot both be missing"
    )

  }

  # Get draft_group_id when it is missing
  if (is.null(draft_group_id)) {

    draft_group_id <- dk_get_contest_info(contest_key)$draft_group_id

  }

  draft_group_id

}

#' Get Draft group
#'
#' Fetch information on the available players for a specific
#' draft group ID. In particular, this includes player names/IDs and
#' their salaries.
#'
#' @inheritParams dk_get_contest_info
#' @inheritDotParams dk_request
#'
#' @param draft_group_id Sequence of digits that correspond to a draft table/group.
#'   If `draft_group_id` and `contest_key` are both passed, `contest_key` is ignored.
#' @param draftable_ids Unique draftable IDs to filter by. If `NULL` (the default),
#'   then all draftable IDs will be included in the result.
#'
#' @examples
#'   \dontrun{
#'     # NFL Showdown Captain Mode
#'     dk_get_draft_group(75284)
#'
#'     # NFL Classic
#'     dk_get_draft_group(74625)
#'   }
#'
#' @export
dk_get_draft_group <- function(draft_group_id = NULL,
                               contest_key = NULL,
                               draftable_ids = NULL,
                               output = c("cleaned_json", "json", "response", "request"),
                               process_args = NULL,
                               ...) {

  output <- rlang::arg_match(output)

  draft_group_id <- check_draft_group_id(draft_group_id, contest_key)

  req <- dk_request(
    ...,
    paths = glue::glue(
      "/draftgroups/v1/draftgroups/{draft_group_id}/draftables/",
      "{paste0(draftable_ids, collapse = ',')}"
    )
  )

  process_args <- c(list(req = req, output = output, objclass = "draft_group_resp"),
                    process_args)

  do.call(dk_request_process, process_args)

}

#' Get List of Draft Groups in Lobby
#'
#' Fetch the full table of draft groups and related info
#' currently present at \url{www.draftkings.com/lobby}.
#'
#' @inheritParams dk_get_lobby_contests
#' @inheritDotParams dk_request
#'
#' @export
dk_get_lobby_draft_groups <- function(sport = NULL,
                             output = c("cleaned_json", "json", "response", "request"),
                             process_args = NULL,
                             ...) {

  output <- rlang::arg_match(output)

  req <- dk_request(
    ...,
    base_url = "https://www.draftkings.com/",
    paths = "lobby/getcontests",
    query_params = list(sport = sport)
  )

  process_args <- c(list(req = req, output = output, objclass = "lobby_draft_groups_resp"),
                    process_args)

  do.call(dk_request_process, process_args)


}

#' Get Draft Group Info
#'
#' Fetch info for a specific draft group
#'
#' @inheritParams dk_get_draft_group
#' @inheritDotParams dk_request
#'
#' @examples
#' \dontrun{
#'   dk_get_draft_group_info(75284)
#'
#' }
#'
#' @export
dk_get_draft_group_info <- function(draft_group_id = NULL,
                                 contest_key = NULL,
                                 output = c("cleaned_json", "json", "response", "request"),
                                 process_args = NULL,
                                 ...) {

  output <- rlang::arg_match(output)

  draft_group_id <- check_draft_group_id(draft_group_id, contest_key)

  req <- dk_request(
    ...,
    paths = glue::glue("draftgroups/v1/{draft_group_id}")
  )

  process_args <- c(list(req = req, output = output, objclass = "draft_group_info_resp"),
                    process_args)

  do.call(dk_request_process, process_args)

}

#' Get Additional Draft Group Info
#'
#' Fetch additional info for a specific draft group
#'
#' @inheritParams dk_get_draft_group
#' @inheritDotParams dk_request
#' @param draft_group_ids One or more draft group IDs. See [dk_get_draft_group()].
#'
#' @examples
#' \dontrun{
#'   dk_get_draft_group_info2(c(75284, 24180))
#'
#' }
#'
#' @export
dk_get_draft_group_info2 <- function(draft_group_ids = NULL,
                                    output = c("cleaned_json", "json", "response", "request"),
                                    process_args = NULL,
                                    ...) {

  output <- rlang::arg_match(output)

  draft_group_ids <- glue::glue_collapse(draft_group_ids, sep = ",")
  req <- dk_request(
    ...,
    paths = glue::glue("sites/US-DK/draftgroups/v3/draftgroups/{draft_group_ids}?format=json")
  )

  process_args <- c(list(req = req, output = output, objclass = "draft_group_info2_resp"),
                    process_args)

  do.call(dk_request_process, process_args)

}

#' Get Player List
#'
#' Fetch list of players and related info for a specific draft group.
#'
#' @inheritParams dk_get_draft_group_info
#' @inheritDotParams dk_request
#'
#' @examples
#' \dontrun{
#'   dk_get_player_list(75284)
#'
#' }
#'
#' @export
dk_get_player_list <- function(draft_group_id = NULL,
                            contest_key = NULL,
                            output = c("cleaned_json", "json", "response", "request"),
                            process_args = NULL,
                            ...) {

  output <- rlang::arg_match(output)

  draft_group_id <- check_draft_group_id(draft_group_id, contest_key)

  req <- dk_request(
    ...,
    paths = "lineup/getavailableplayers",
    base_url = "https://www.draftkings.com/",
    query_params = list("draftGroupId" = draft_group_id)
  )

  process_args <- c(list(req = req, output = output, objclass = "player_list_resp"),
                    process_args)

  do.call(dk_request_process, process_args)

}

#' Get Team List
#'
#' Fetch list of teams for a specific draft group.
#'
#' @inheritParams dk_get_draft_group_info
#' @inheritDotParams dk_request
#'
#' @export
dk_get_team_list <- function(draft_group_id = NULL,
                          contest_key = NULL,
                          output = c("cleaned_json", "json", "response", "request"),
                          process_args = NULL,
                          ...) {

  output <- rlang::arg_match(output)

  draft_group_id <- check_draft_group_id(draft_group_id, contest_key)

  req <- dk_request(
    ...,
    paths = "lineup/getavailableplayers",
    base_url = "https://www.draftkings.com/",
    query_params = list("draftGroupId" = draft_group_id)
  )

  process_args <- c(list(req = req, output = output, objclass = "team_list_resp"),
                    process_args)

  do.call(dk_request_process, process_args)

}

#' Get Player Fantasy Points Earned
#'
#' Retrieve player fantasy points earned in each
#' game for a given season and week (NFL) or date (NBA/MLB).
#'
#' @inheritParams dk_get_contest_info
#' @inheritDotParams dk_request
#'
#' @param timeframe integer. Either the week number for NFL, or a date of the form `20230312` for
#'   MLB and NBA. If the timeframe format detected does not match the sport argument passed, an
#'   error is returned.
#' @param season integer. optional. Defaults to the current season year.
#' @param sport character. Defaults to NFL.
#'
#' @details Data starts on October 18th, 2022 for NBA.
#'
#' @export
dk_get_player_fp <- function(timeframe,
                             season = as.numeric(format(Sys.Date(), "%Y")),
                             sport = c("nfl", "nba", "mlb"),
                             output = c("cleaned_json", "json", "response", "request"),
                             process_args = NULL,
                             ...) {

  output <- rlang::arg_match(output)
  sport <- rlang::arg_match(sport)

  # Error if timeframe does not correspond to sport
  if ((nchar(timeframe) > 2 & sport == "nfl") | (nchar(timeframe) != 8 & sport != "nfl")) {
    cli::cli_abort(
      "Incorrect `timeframe` or `sport`. Ensure the timeframe argument corresponds to the sport."
    )
  }

  # Create path based on sport
  if (sport == "nfl") {

    path <- glue::glue("leaderboards/players/seasons/{season}/weeks/{timeframe}")

  } else if (sport %in% c("nba", "mlb")) {

    path <- glue::glue("leaderboards/players/seasons/{season}/dates/{timeframe}")

  } else {

    cli::cli_abort("`{sport}` not a supported sport.")

  }

  req <- dk_request(
    ...,
    base_url = "https://live.draftkings.com/api/v2/",
    paths = path,
    headers = list('Content-Type' = 'application/json',
                    'Accept' = '*/*',
                    'Accept-Encoding' = 'gzip, deflate, br'),
    method = "POST"
  ) %>%
    httr2::req_body_raw(
      glue::glue('{{"sport":"{sport}","embed":"stats"}}')
    )

  process_args <- c(list(req = req, output = output, objclass = "player_fp_resp"),
                    process_args)

  do.call(dk_request_process, process_args)

}
