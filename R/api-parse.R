
#### Utils -----------------------------------------------------------------------------------------
#' Extract JSON from Response
#'
#' @noRd
#' @keywords internal
extract_json <- function(resp) {

  if (inherits(resp, "httr2_response")) {

    resp <- httr2::resp_body_json(resp)

  }

  resp

}

#' Convert JSON to Tibble
#'
#' @noRd
#' @keywords internal
convert_json <- function(resp) {

  resp %>%
    purrr::compact() %>%
    tidyjson::spread_all() %>%
    tidyjson::as_tibble() %>%
    dplyr::select(-"document.id") %>%
    clean_names()

}

## Parse -------------------------------------------------------------------------------------------

#' Parse Response JSON
#'
#' @inheritParams httr2::resp_body_json
#'
#' @export
dk_resp_parse <- function(resp) {
  UseMethod("dk_resp_parse")
}

#' @export
dk_resp_parse.default <- function(resp) {

  extract_json(resp)

}

#### Contest ---------------------------------------------------------------------------------------

#' @method dk_resp_parse contest_info_resp
#' @export
dk_resp_parse.contest_info_resp <- function(resp) {

  resp %>%
    extract_json() %>%
    convert_json()

}

#' @method dk_resp_parse contests_resp
#' @export
dk_resp_parse.contests_resp <- function(resp) {

  resp <- extract_json(resp)

  resp$Contests %>%
    convert_json()

}

#' @method dk_resp_parse gametype_rules_resp
#' @export
dk_resp_parse.gametype_rules_resp <- function(resp) {

  resp <- extract_json(resp)

  scalar_indices <- resp %>%
    tidyjson::json_lengths() %>%
    dplyr::filter(length == 1 | length == 0) %>%
    dplyr::pull("document.id")

  scalar_names <- names(resp[scalar_indices])

  d1 <- purrr::map2_dfc(
    scalar_indices,
    scalar_names,
    function(x, y) {

      val <- resp[[x]]
      val <- ifelse(is.null(val), NA, val)
      df <- data.frame(val)
      stats::setNames(df, y)

    }
  )

  d2 <- purrr::map_dfc(
    c("salaryCap", "gameCount", "teamCount"),
    function(x) {

      vals <- purrr::map(resp[[x]], function(val) ifelse(is.null(val), NA, val))
      tbl <- dplyr::as_tibble(vals)
      stats::setNames(tbl, paste0(x, "_", names(tbl)))

    }
  )

  dplyr::bind_cols(d1, d2) %>%
    dplyr::as_tibble() %>%
    clean_names()

}

#' @method dk_resp_parse game_types_resp
#' @importFrom rlang .data .env
#' @export
dk_resp_parse.game_types_resp <- function(resp) {

  resp <- extract_json(resp)

  resp$GameTypes %>%
    dplyr::bind_rows() %>%
    dplyr::mutate(
      "GameStyleName" = paste0("game_style_", names(.data$GameStyle)) %>%
        gsub("game_style_GameStyle", "game_style", .),
      "GameStyleValue" = as.character(.data$GameStyle)
    ) %>%
    dplyr::select(-"GameStyle") %>%
    tidyr::pivot_wider(names_from = "GameStyleName",
                       values_from = "GameStyleValue",
                       names_repair = "minimal") %>%
    clean_names()

}

#### Draftgroup ------------------------------------------------------------------------------------




dk_resp_parse.draftable_players_resp <- function(resp) {

  resp$draftables %>%
    extract_json() %>%
    convert_json()

}

#' @method dk_resp_parse draft_groups_resp
#' @export
dk_resp_parse.draft_groups_resp <- function(resp) {

  resp <- extract_json(resp)

  resp$DraftGroups %>%
    convert_json()

}

#' @method dk_resp_parse draft_group_info_resp
#'
#' @importFrom rlang .data .env
#'
#' @export
dk_resp_parse.draft_group_info_resp <- function(resp) {

  resp <- extract_json(resp)

  resp$draftGroup %>%
    purrr::compact() %>%
    dplyr::as_tibble() %>%
    dplyr::mutate("contestTypeValue" = as.character(.data$contestType),
                  "contestTypeName" = names(.data$contestType)) %>%
    dplyr::select(-"contestType") %>%
    tidyr::pivot_wider(names_from = "contestTypeName",
                       values_from = "contestTypeValue") %>%
    tidyr::unnest_wider("games", names_repair = "minimal") %>%
    tidyr::unnest_wider("sportSpecificData") %>%
    tidyr::unnest_wider("leagues") %>%
    dplyr::mutate(
      "gameAttributes" = list(
        .data$gameAttributes %>%
          unlist %>%
          stats::setNames(., paste0("gameAttributes_", names(.),
                             sort(rep(seq.int(1, length(.) / 2, 1), 2))))
      )
    ) %>%
    tidyr::unnest_wider("gameAttributes") %>%
    dplyr::select(-"sport.1") %>%
    clean_names()

}

#' @method dk_resp_parse player_list_resp
#'
#' @importFrom rlang .data .env
#'
#' @export
dk_resp_parse.player_list_resp <- function(resp) {

  resp <- extract_json(resp)

   convert_json(resp$playerList)

}


#' @method dk_resp_parse team_list_resp
#'
#' @export
dk_resp_parse.team_list_resp <- function(resp) {

  resp <- extract_json(resp)

   convert_json(resp$teamList)

}

#' @method dk_resp_parse player_points_resp
#'
#' @export
dk_resp_parse.player_points_resp <- function(resp) {

  resp <- extract_json(resp)

  convert_json(resp$data)

}

## Leaderboard -------------------------------------------------------------------------------------

#' @method dk_resp_parse leaderboard_resp
#'
#' @export
dk_resp_parse.leaderboard_resp <- function(resp) {

  resp <- extract_json(resp)

  dplyr::bind_rows(resp$leaderBoard) %>%
    clean_names()

}
