
#' Check Draft Group Inputs
#'
#' Use either `draft_group_id` or `contest_id` if `draft_group_id` is `NULL`.
check_draft_group_id <- function(draft_group_id, contest_id) {

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
#'
#' @param draft_group_id Sequence of digits that correspond to a draft table/group.
#'   If `draft_group_id` and `contest_id` are both passed, `contest_id` is ignored.
#'
#' @examples
#'   \dontrun{
#'     get_draft_group_info(75367)
#'   }
#'
#' @export
get_draftable_players <- function(draft_group_id = NULL,
                            contest_id = NULL) {

  draft_group_id <- check_draft_group_id(draft_group_id, contest_id)

  draft_groups_json <- httr2::request(
    glue::glue("https://api.draftkings.com/draftgroups/v1/draftgroups/{draft_group_id}/draftables")
  ) %>%
    httr2::req_perform() %>%
    httr2::resp_body_json()

  draft_groups_json$draftables %>%
    tidyjson::spread_all() %>%
    dplyr::as_tibble() %>%
    dplyr::select(-document.id) %>%
    clean_names()

}

#' Get Draft Group Info

#' Get List of Draft Groups
#'
#' Fetch the full table of draft groups and related info
#'
#' @export
get_draft_groups <- function() {

  res <- httr2::request(base_url = "https://www.draftkings.com/lobby/getcontests") %>%
    httr2::req_perform() %>%
    httr2::resp_body_json()

  res$DraftGroups %>%
    tidyjson::spread_all() %>%
    dplyr::as_tibble() %>%
    dplyr::select(-document.id) %>%
    clean_names()

}

#' Get Draft Group Info
#'
#' Fetch info for a specific draft group
#'
#' @inheritParams get_draftable_players
#'
#' @export
get_draft_group_info <- function(draft_group_id = NULL,
                                 contest_id = NULL) {

  draft_group_id <- check_draft_group_id(draft_group_id, contest_id)

  res <- httr2::request(
    glue::glue("https://api.draftkings.com/draftgroups/v1/{draft_group_id}")
  ) %>%
    httr2::req_perform() %>%
    httr2::resp_body_string()

  res %>%
    tidyjson::enter_object("draftGroup") %>%
    tidyjson::spread_all() %>%
    dplyr::as_tibble() %>%
    dplyr::select(-document.id) %>%
    clean_names()


}

#' Get Player List
#'
#' Fetch list of players for a specific draft group and related info
#'
#' @inheritParams get_draft_group_info
#'
#' @export
get_player_list <- function(draft_group_id = NULL,
                            contest_id = NULL) {

  draft_group_id <- check_draft_group_id(draft_group_id, contest_id)

  res <- httr2::request("https://www.draftkings.com/lineup/getavailableplayers") %>%
    httr2::req_url_query(draftGroupId = draft_group_id) %>%
    httr2::req_perform() %>%
    httr2::resp_body_json()

  res$playerList %>%
    tidyjson::spread_all() %>%
    dplyr::as_tibble() %>%
    dplyr::select(-document.id) %>%
    clean_names()

}

#' Get Team List
#'
#' Fetch list of teams for a specific draft group and related info
#'
#' @inheritParams get_draft_group_info
#'
#' @export
get_team_list <- function(draft_group_id = NULL,
                            contest_id = NULL) {

  draft_group_id <- check_draft_group_id(draft_group_id, contest_id)

  res <- httr2::request("https://www.draftkings.com/lineup/getavailableplayers") %>%
    httr2::req_url_query(draftGroupId = draft_group_id) %>%
    httr2::req_perform() %>%
    httr2::resp_body_json()

  res$teamList %>%
    tidyjson::spread_all() %>%
    dplyr::as_tibble() %>%
    dplyr::select(-document.id) %>%
    clean_names()

}
