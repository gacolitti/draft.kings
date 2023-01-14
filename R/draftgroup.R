
#' Check Draft Group Inputs
#'
#' Use either `draft_group_id` or `contest_id` if `draft_group_id` is `NULL`.
#' @inheritParams get_draftable_players
check_draft_group_id <- function(draft_group_id = NULL, contest_id = NULL) {

  # Ensure at least one argument is passed
  if (all(is.null(draft_group_id), is.null(contest_id))) {

    cli::cli_abort(
      "`draft_group_id` and `contest_id` cannot both be missing"
    )

  }

  # Get draft_group_id when it is missing
  if (is.null(draft_group_id)) {

    draft_group_id <- get_contest_info(contest_id)$draft_group_id

  }

  draft_group_id

}

#' Get Draftable Players
#'
#' Fetch information on the available lineup for a specific
#'   competition. In particular, this includes player names/IDs and
#'   their salaries.
#'
#' @inheritParams get_contest_info
#' @inheritDotParams get_contest_info
#'
#' @importFrom rlang .data .env
#'
#' @param draft_group_id Sequence of digits that correspond to a draft table/group.
#'   If `draft_group_id` and `contest_id` are both passed, `contest_id` is ignored.
#'
#' @examples
#'   \dontrun{
#'     get_draft_group(75367)
#'   }
#'
#' @export
get_draftable_players <- function(draft_group_id = NULL,
                                  contest_id = NULL,
                                  output = c("cleaned_json", "json", "response", "request"),
                                  ...) {

  output <- rlang::arg_match(output)

  draft_group_id <- check_draft_group_id(draft_group_id, contest_id)

  req <- dk_request(
    ...,
    paths = glue::glue(
      "/draftgroups/v1/draftgroups/{draft_group_id}/draftables"
    )
  )

  dk_request_process(req, output, objclass = "draftable_players_resp")

}

#' Get Draft Group Info

#' Get List of Draft Groups
#'
#' Fetch the full table of draft groups and related info
#'
#' @inheritParams get_contests
#' @inheritDotParams get_contests
#'
#' @export
get_draft_groups <- function(sport = NULL,
                             output = c("cleaned_json", "json", "response", "request"),
                             ...) {

  output <- rlang::arg_match(output)

  req <- dk_request(
    ...,
    base_url = "https://www.draftkings.com/",
    paths = "lobby/getcontests",
    query_params = list(sport = sport)
  )

  dk_request_process(req, output, objclass = "draft_groups_resp")

}

#' Get Draft Group Info
#'
#' Fetch info for a specific draft group
#'
#' @inheritParams get_draftable_players
#' @inheritDotParams get_draftable_players
#'
#' @export
get_draft_group_info <- function(draft_group_id = NULL,
                                 contest_id = NULL,
                                 output = c("cleaned_json", "json", "response", "request"),
                                 ...) {

  output <- rlang::arg_match(output)

  draft_group_id <- check_draft_group_id(draft_group_id, contest_id)

  req <- dk_request(
    ...,
    paths = glue::glue("draftgroups/v1/{draft_group_id}")
  )

  dk_request_process(req, output, objclass = "draft_group_info_resp")

}

#' Get Player List
#'
#' Fetch list of players for a specific draft group and related info
#'
#' @inheritParams get_draft_group_info
#' @inheritDotParams get_draft_group_info
#'
#' @export
get_player_list <- function(draft_group_id = NULL,
                            contest_id = NULL,
                            output = c("cleaned_json", "json", "response", "request"),
                            ...) {

  output <- rlang::arg_match(output)

  draft_group_id <- check_draft_group_id(draft_group_id, contest_id)

  req <- dk_request(
    ...,
    paths = "lineup/getavailableplayers",
    base_url = "https://www.draftkings.com/",
    query_params = list("draftGroupId" = draft_group_id)
  )

  dk_request_process(req, output, objclass = "player_list_resp")

}

#' Get Team List
#'
#' Fetch list of teams for a specific draft group and related info
#'
#' @inheritParams get_draft_group_info
#' @inheritDotParams get_draft_group_info
#'
#' @export
get_team_list <- function(draft_group_id = NULL,
                          contest_id = NULL,
                          output = c("cleaned_json", "json", "response", "request"),
                          ...) {

  output <- rlang::arg_match(output)

  draft_group_id <- check_draft_group_id(draft_group_id, contest_id)

  req <- dk_request(
    ...,
    paths = "lineup/getavailableplayers",
    base_url = "https://www.draftkings.com/",
    query_params = list("draftGroupId" = draft_group_id)
  )

  dk_request_process(req, output, objclass = "team_list_resp")

}

#' Get Player Points Earned
#'
#' Retrieve player fantasy points earned in each
#' game for a given season and week.
#'
#' @inheritParams get_contest_info
#' @inheritDotParams get_contest_info
#'
#' @param week integer.
#' @param year integer. optional. Defaults to the current year.
#' @param sport character. Defaults to NFL.
#'
get_player_points <- function(week,
                              year = as.numeric(format(Sys.Date(), "%Y")),
                              sport = "nfl",
                              output = c("cleaned_json", "json", "response", "request"),
                              ...) {

  output <- rlang::arg_match(output)

  req <- dk_request(
    ...,
    base_url = "https://live.draftkings.com/api/v2/",
    paths = glue::glue("leaderboards/players/seasons/{year}/weeks/{week}"),
    headers = list('Content-Type' = 'application/json',
                    'Accept' = '*/*',
                    'Accept-Encoding' = 'gzip, deflate, br'),
    method = "POST"
  ) %>%
    httr2::req_body_raw(
      glue::glue('{{"sport":"{sport}","embed":"stats"}}')
    )

  dk_request_process(req, output, objclass = "player_points_resp")

}
