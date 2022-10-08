
#' Get Lineup Rules
#'
#' Fetch rules corresponding to a specific game type ID.
#'
#' @param game_type_id Integer corresponding to the game type.
#'   For example, 159 in \url{https://api.draftkings.com/lineups/v1/gametypes/159/rules}.
#'   If both `game_type_id` and `contest_id` are passed, then `contest_id` is ignored.
#'
#' @export
get_lineup_rules <- function(game_type_id = NULL,
                             contest_id = NULL) {

  if (all(is.null(game_type_id), is.null(contest_id))) {

    cli::cli_abort(
      "`game_type_id` and `contest_id` cannot both be missing"
    )

  }

  if (is.null(game_type_id)) {

    game_type_id <- get_contest(contest_id)$game_type_id

  }

  httr2::request(
      glue::glue("https://api.draftkings.com/lineups/v1/gametypes/{game_type_id}/rules")
    ) %>%
    httr2::req_perform() %>%
    httr2::resp_body_string() %>%
    tidyjson::spread_all() %>%
    as_tibble() %>%
    select(-document.id) %>%
    clean_names()

}
