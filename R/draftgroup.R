
#' Get Draft Group Data
#'
#' Fetch information on the available lineup for a specific
#'   competition. In particular, this includes player names/IDs and
#'   their salaries.
#'
#' @inheritParams get_contest
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
get_draft_group <- function(draft_group_id = NULL,
                            contest_id = NULL) {

  # Ensure at least one argument is passed
  if (all(is.null(draft_group_id), is.null(contest_id))) {

    cli::cli_abort(
      "`draft_group_id` and `contest_id` cannot both be missing"
    )

  }

  # Get draft_group_id when it is missing
  if (is.null(draft_group_id)) {

    draft_group_id <- get_contest(contest_id)$draft_group_id

  }

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

