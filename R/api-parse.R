
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

#' @method dk_resp_parse lobby_contests_resp
#' @export
dk_resp_parse.lobby_contests_resp <- function(resp) {

  resp <- extract_json(resp)

  resp$Contests %>%
    convert_json()

}

#' @method dk_resp_parse game_type_rules_resp
#' @export
dk_resp_parse.game_type_rules_resp <- function(resp) {

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

#' @method dk_resp_parse lobby_game_types_resp
#' @export
dk_resp_parse.lobby_game_types_resp <- function(resp) {

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

dk_resp_parse.draft_group_resp <- function(resp) {

  resp$draftables %>%
    extract_json() %>%
    convert_json() %>%
    stats::setNames(., gsub("competition_competition", "competition", colnames(.)))

}

#' @method dk_resp_parse lobby_draft_groups_resp
#' @export
dk_resp_parse.lobby_draft_groups_resp <- function(resp) {

  resp <- extract_json(resp)

  resp$DraftGroups %>%
    convert_json()

}

#' @method dk_resp_parse draft_group_info_resp
#'
#' @export
dk_resp_parse.draft_group_info_resp <- function(resp) {

  json <- extract_json(resp)

  # Extract contest type and leagues
  contest_type <- dplyr::as_tibble(json$draftGroup$contestType)
  leagues <- purrr::map_dfr(json$draftGroup$leagues, dplyr::as_tibble)

  # Extract games
  games <- purrr::map_dfr(json$draftGroup$games, function(.game) {

    # Remove gameAttributes list if it exists
    .game$gameAttributes <- NULL

    # Extract sport specific data
    if (!is.null(.game$sportSpecificData) && length(.game$sportSpecificData) > 0) {

      sport_specific_data <- .game$sportSpecificData %>%
        dplyr::as_tibble() %>%
        stats::setNames(., paste0("sport_specific_data_", colnames(.)))

    }

    .game$sportSpecificData <- NULL

    if (exists("sport_specific_data")) {

      out <- dplyr::bind_cols(dplyr::as_tibble(.game), sport_specific_data)

    } else {

      out <- dplyr::as_tibble(.game)

    }

    out
  })

  # Remove list elements from json
  # Combine remaining draft group info with contest type info
  draft_group_info <- json$draftGroup %>%
    purrr::discard(is.list) %>%
    dplyr::as_tibble() %>%
    dplyr::bind_cols(contest_type)

  # Combine draft group info, games, and leagues into list
  list(info = clean_names(draft_group_info),
       games = clean_names(games),
       leagues = clean_names(leagues))


}

#' @method dk_resp_parse player_list_resp
#'
#' @export
dk_resp_parse.player_list_resp <- function(resp) {

  resp <- extract_json(resp)

  new_names <- c(pid = "player_id",
                 did = "did", # unknown
                 pcode = "pcode", # unknown
                 tsid = "competition_id",
                 fn = "first_name",
                 ln = "last_name",
                 fnu = "first_name_duplicate",
                 lnu = "last_name_duplicate",
                 jn = "jersey_number",
                 pn = "position",
                 dgst = "competition_start_time",
                 tid = "team_id",
                 htid = "home_team_id",
                 atid = "away_team_id",
                 htabbr = "home_team_abbreviation",
                 atabbr = "away_team_abbreviation",
                 posid = "position_id",
                 rosposid = "roster_slot_id",
                 slo = "slo", # unknown
                 is_disabled_from_drafting = "is_disabled",
                 s = "salary",
                 ppg = "points_per_game",
                 or = "own_rate",
                 swp = "is_swappable",
                 ipc = "in_play_contest",
                 pp = "pp", # unknown
                 i = "injury_status",
                 news = "news_code",
                 img_lg = "large_image_url",
                 alt_img_lg = "alternate_large_image_url",
                 img_sm = "small_image_url",
                 alt_img_sm = "alternate_small_image_url")

   convert_json(resp$playerList) |>
     stats::setNames(new_names)

}


#' @method dk_resp_parse team_list_resp
#'
#' @export
dk_resp_parse.team_list_resp <- function(resp) {

  resp <- extract_json(resp)

   convert_json(resp$teamList)

}

#' @method dk_resp_parse player_fp_resp
#'
#' @export
dk_resp_parse.player_fp_resp <- function(resp) {

  resp <- extract_json(resp)

  convert_json(resp$data)

}


#' @method dk_resp_parse draft_group_info2_resp
#'
#' @export
dk_resp_parse.draft_group_info2_resp <- function(resp) {

  resp <- extract_json(resp)

  draft_groups <- dplyr::tibble(draft_groups = resp$draftGroups) |>
    tidyr::unnest_wider(col = "draft_groups") |>
    dplyr::mutate(leagues = purrr::map(.data$leagues, as.data.frame)) |>
    tidyr::unnest_wider("leagues") |>
    tidyr::unnest_wider(col = "allTags", names_sep = "") |>
    dplyr::mutate(competitionIds = purrr::map_chr(.data$competitionIds, ~paste0(.x, collapse = ","))) |>
    clean_names()

  game_types <- dplyr::tibble(gameStyles = resp$gameStyles) |>
    tidyr::hoist(.col = "gameStyles", "gameTypes") |>
    tidyr::unnest(cols = "gameTypes") |>
    tidyr::unnest_wider("gameTypes", names_sep = "_") |>
    clean_names() |>
    dplyr::select(-"game_styles")

  game_styles <- dplyr::tibble(gameStyles = resp$gameStyles) |>
    tidyr::hoist(.col = "gameStyles", "gameTypes") |>
    tidyr::unnest_wider("gameStyles", names_sep = "_") |>
    clean_names() |>
    dplyr::select(-"game_types", -"game_styles_attributes")

  sports <- dplyr::tibble(sports = resp$sports) |>
    tidyr::unnest_wider(col = "sports")

  tmp_competitions <- dplyr::tibble(game_sets = resp$gameSets) |>
    tidyr::unnest_wider(col = "game_sets") |>
    tidyr::unnest_longer(col = "competitions") |>
    dplyr::select(-"sportId") |>
    tidyr::unnest_wider(col = "competitions") |>
    tidyr::unnest_wider(col = "homeTeam", names_sep = "_") |>
    tidyr::unnest_wider(col = "awayTeam", names_sep = "_")

  if (purrr::pluck_exists(tmp_competitions, "weather")) {
    tmp_competitions <- tmp_competitions |>
      tidyr::unnest_wider(col = "weather", names_sep = "_")
  }

  competitions <- tmp_competitions |>
    dplyr::mutate(gameSetKey = resp$gameSets$gameSetKey) |>
    clean_names()

  competition_attributes <- competitions |>
    dplyr::select("competition_id", "competition_attributes") |>
    tidyr::unnest_longer("competition_attributes") |>
    tidyr::unnest_wider("competition_attributes")

  competitions$competition_attributes <- NULL

  list(
    draft_groups = draft_groups,
    game_types = game_types,
    game_styles = game_styles,
    sports = sports,
    competitions = competitions,
    competition_attributes = competition_attributes
  )

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

#' @method dk_resp_parse entries_resp
#'
#' @export
dk_resp_parse.entries_resp <- function(resp) {

  resp <- extract_json(resp)

  purrr::map_dfr(
    resp$entries,
    function(.entry) {

      # Extract keys from entry information
      entry_info <- .entry

      entry_info <- entry_info[c("contestKey", "entryKey", "userKey", "draftGroupId", "lineupId")] %>%
        dplyr::bind_rows() %>%
        clean_names()

      # Extract all player stats and combine into table
      stats <- purrr::map_dfr(
        .entry$roster$scorecards,
        function(.scorecard) {

          stats <- dplyr::bind_rows(.scorecard$stats)

          # Get percent drafted captain from playerUtilizations nested list
          # Percent drafted "all" is already included so no need to extract
          if (!is.null(.scorecard$playerUtilizations) &&
              length(.scorecard$playerUtilizations) == 2) {
            percent_drafted_cpt <- .scorecard$playerUtilizations[[2]]$value
          } else {
            percent_drafted_cpt <- NULL
          }
          .scorecard$playerUtilizations <- NULL

          # Get player link (appears to be link to live boxscore page)
          if (!is.null(.scorecard$playerLink) &&
              length(.scorecard$playerLink) > 0) {
            player_deep_link <- .scorecard$playerLink[[1]]$DeepLink
          } else {
            player_deep_link <- NULL
          }
          .scorecard$playerLink <- NULL

          if (!is.null(.scorecard$projection$valueIcon)) {
            player_projection_icon <- .scorecard$projection$valueIcon
          } else {
            player_projection_icon <- NULL
          }
          .scorecard$projection <- NULL

          # Remove competition nested list because this information is redundant
          .scorecard$competition <- NULL

          # Remove player stats because this has already been extracted
          .scorecard$stats <- NULL

          # Remove other unknown columns if present
          .scorecard$playerStates <- NULL
          .scorecard$attributes <- NULL

          player_info <- dplyr::bind_rows(.scorecard)
          player_info$percent_drafted_cp <- percent_drafted_cpt
          player_info$player_deep_link <- player_deep_link
          player_info$player_projection_icon <- player_projection_icon

          player_info %>%
            tidyr::crossing(stats) %>%
            clean_names()

        }
      )

      # Sometimes stats are missing
      # In this case, just return the entry info
      if (purrr::is_empty(stats)) return(entry_info)

      # Combine entry info keys with stats
      # This should be a one to many crossing,
      # because entry info should be one row and stats should
      # be multiple rows.
      tidyr::crossing(entry_info, stats)

    }
  )

}

## Sports ------------------------------------------------------------------------------------------

#' @method dk_resp_parse sports_resp
#'
#' @export
dk_resp_parse.sports_resp <- function(resp) {

  resp <- extract_json(resp)

  dplyr::bind_rows(resp$sports) %>%
    clean_names()

}

## Competition -------------------------------------------------------------------------------------

#' @method dk_resp_parse competitions_resp
#'
#' @export
dk_resp_parse.competitions_resp <- function(resp) {

  resp <- extract_json(resp)

  dplyr::tibble("competitions" = resp$competitions) |>
    tidyr::hoist(.col = "competitions", "competitionId", "sport", "startTime",
                 "competitionState", "CompetitionStateDetail",
                 "timeRemainingStatus", "homeTeam", "awayTeam",
                 "sportSpecificData", "gameAttributes") |>
    tidyr::unnest_wider(col = "awayTeam", names_sep = "_") |>
    tidyr::unnest_wider(col = "homeTeam", names_sep = "_") |>
    tidyr::unnest_wider(col = "sportSpecificData") |>
    # TODO: Name value game attribute pairs removed here.
    # Currently there is no mapping of the typeId (code) to a name
    dplyr::select(-"gameAttributes") |>
    dplyr::select(-"competitions") |>
    clean_names()

}
