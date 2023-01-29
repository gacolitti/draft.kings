
## Prep and extract  -------------------------------------------------------------------------------

#' Prepare Contest Schematic
#'
#' Combine information needed for optimization.
#' Passed to `dk_optimize()`.
#'
#' @inheritParams get_contest_info
#'
#' @importFrom rlang .data .env
#'
#' @param draft_group Object returned by `get_draftable_players()`. If `NULL` (the default),
#'   then this object is fetched using the `contest_id`. The following columns are required:
#'    draftable_id, player_id, first_name, last_name, display_name, salary, team_id, status.
#' @param draft_group_exp_fp A data.frame with two columns `draftable_id`
#'   (found in the output of `get_draftable_players()`) and `exp_fp`
#'   (expected fantasy points). Note that the Showdown Captain Mode contest type includes
#'   two rows for each player/defense. If `draft_group` contains rows not found in
#'   `draft_group_exp_fp`, then a warning is issued and those missing rows are dropped.
#'   If `NULL` (the default), then `exp_fp` is set equal to the `ppg` value returned by
#'   `get_player_list()`.
#' @param include_players A vector of player IDs to include. If `NULL` (the default), then use
#'   all players found with `get_draftable_players()`.
#' @param exclude_players A vector of player IDs to exclude.
#' @param rules Object returned by `get_gametype_rules()`. If `NULL` (the default),
#'   rules are fetched using the `contest_id`.
#' @param exclude_questionable Exclude players with statuses that indicate
#'   they will not play. These include players that are questionable,
#'   doubtful, out, and injured.
#'
#' @examples
#'   \dontrun{
#'     prepare_contest_schematic(contest_id = 133645678)
#'   }
#'
#' @export
prepare_contest_schematic <- function(contest_id,
                                      draft_group_exp_fp = NULL,
                                      draft_group = NULL,
                                      rules = NULL,
                                      include_players = NULL,
                                      exclude_players = NULL,
                                      exclude_questionable = TRUE) {

  players_intersect <- intersect(include_players, exclude_players)

  if (length(players_intersect) > 0) {

    cli::cli_abort(
        "You cannot include the same player IDs in `include_players` and `exclude_players`."
    )

  }

  # Check for expected column names in rules
  if (!is.null(rules)) {

    missing_cols <- setdiff(c("salary_cap_max_value", "team_count_min_value", "unique_players"),
                            colnames(rules))

    if (length(missing_cols) > 0) {

      cli::cli_abort("Missing required columns(?s) from `rules`: {missing_cols}")

    }

  }

  # Check for expected column names in draft_group_exp_fp
  if (!is.null(draft_group_exp_fp)) {

    missing_cols <- setdiff(c("draftable_id", "exp_fp"), colnames(draft_group_exp_fp))

    if (length(missing_cols) > 0) {

      cli::cli_abort("Missing required columns(?s) from `draft_group_exp_fp`: {missing_cols}")

    }

  }

  # Check for expected column names in draft_group
  if (!is.null(draft_group)) {

    missing_cols <- setdiff(c("draftable_id",
                              "player_id",
                              "first_name",
                              "last_name",
                              "display_name",
                              "salary",
                              "team_id",
                              "status"), colnames(draft_group))

    if (length(missing_cols) > 0) {

      cli::cli_abort("Missing required column(?s) from `draft_group` {missing_cols}")

    }

  }

  # Fetch contest info if rules, draft_group, or draft_group_exp_fp not passed
  if (is.null(rules) || is.null(draft_group) || is.null(draft_group_exp_fp)) {

    contest_info <- get_contest_info(contest_id)

  }

  # Fetch rules if not passed
  if (is.null(rules)) {

    rules <- get_gametype_rules(game_type_id = contest_info$game_type_id)

  }

  # Fetch draft group if not passed
  if (is.null(draft_group)) {

    draft_group <- get_draftable_players(draft_group_id = contest_info$draft_group_id)

  }

  # Ensure each row in draft_group has a match in draft_group_exp_fp
  if (!is.null(draft_group_exp_fp)) {

    # Check for missing rows in draft_group_exp_fp based on rows in draft_group
    missing_draft_group <- dplyr::anti_join(draft_group, draft_group_exp_fp, by = "draftable_id")

    if (nrow(missing_draft_group) > 0) {

      cli::cli_warn(
        "Found draftable IDs in `draft_group` not found in `draft_group_exp_fp`"
      )

    }

  }

  # Subset columns in draft_group
  draft_group <- draft_group %>%
    dplyr::select(
      "draftable_id",
      "player_id",
      "first_name",
      "last_name",
      "display_name",
      "salary",
      "team_id",
      "status"
    )

  # Optionally remove players with a status other than "None"
  if (exclude_questionable) {

    draft_group <- draft_group %>%
      dplyr::filter(.data$status == "None")

  }

  # Optionally exclude players
  if (!is.null(exclude_players)) {

    draft_group <- draft_group %>%
      dplyr::filter(
        !.data$player_id %in% .env$exclude_players
      )

  }

  # Optionally include subset of players
  if (!is.null(include_players)) {

    draft_group <- draft_group %>%
      dplyr::filter(
        .data$player_id %in% .env$include_players
      )

  }

  # Add expected fantasy points to draft group
  if (is.null(draft_group_exp_fp)) {

    player_list <- get_player_list(draft_group_id = contest_info$draft_group_id) %>%
      dplyr::transmute("player_id" = .data$pid, "exp_fp" = as.numeric(.data$ppg))

    draft_group <- draft_group %>%
      dplyr::left_join(player_list, by = "player_id")

  }

  # Adjust exp_fp if game type is showdown captain mode
  # Add column to indicate captain
  if (rules$game_type_name == "Showdown Captain Mode") {

    draft_group <- draft_group %>%
      dplyr::group_by(.data$player_id) %>%
      dplyr::mutate("exp_fp" = ifelse(.data$salary == max(.data$salary),
                                      .data$exp_fp * 1.5,
                                      .data$exp_fp),
                    "is_captain" = ifelse(.data$salary == max(.data$salary),
                                                         TRUE,
                                                         FALSE)) %>%
      dplyr::ungroup()

  }

  # Add row number
  draft_group <- draft_group %>%
    dplyr::mutate("row_number" = dplyr::row_number())

  # Combine objects into list
  out <- list(draft_group = draft_group,
              rules = rules,
              contest_id = contest_id)

  # Add class based on game type found in rules
  class(out) <- c(clean_names(rules$game_type_name), class(out))

  out

}

#' Extract Solution
#'
#' Extract information from optimized lineup solution
#'
#' @param solved_model Optimal lineup object created by [draft.kings::dk_optimize_lineup()].
#'
#' @export
dk_extract_solution <- function(solved_model) {

  res <- solved_model$solved_model %>%
    ompr::get_solution(draftable_id[i]) %>%
    dplyr::filter(.data$value > 0) %>%
    dplyr::inner_join(solved_model$contest_schematic$draft_group, by = c("i" = "row_number")) %>%
    dplyr::select(-dplyr::any_of(c("i", "value", "variable"))) %>%
    dplyr::arrange(dplyr::desc(.data$is_captain))

  list(
    optimal_lineup = res,
    salary = sum(res$salary),
    expected_points = ompr::objective_value(solved_model$solved_model)
  )

}

#' Get Multiple Optimal Lineups
#'
#' Wrapper around [dk_optimize_lineup()]. Can return an
#'   arbitrary number of optimal lineups in succession.
#'
#' @inheritParams dk_optimize_lineup
#' @param n Number of lineups to return.
#' @param tolerance The difference in fantasy points between the previous
#'   optimal lineup and the current optimal lineup during iterations.
#'   Usually the default of 0.001 is fine.
#'
#' @export
dk_get_optimal_lineups <-function(contest_schematic,
                                  n = 1,
                                  tolerance = 0.001) {

  optimal_lineups <- NULL
  max_points <- NULL

  for (i in 1:n) {

    if (!is.null(optimal_lineups)) {

      max_points <- optimal_lineups[[i - 1]]$solved_model$objective_value - tolerance

    }

    optimal_lineups[[i]] <- dk_optimize_lineup(
      contest_schematic = contest_schematic,
      max_points = max_points
    )

  }

  optimal_lineups <- stats::setNames(optimal_lineups, paste0("solution_",
                                                             seq_len(length(optimal_lineups))))

  class(optimal_lineups) <- c("showdown_captain_mode_multiple_solutions", class(optimal_lineups))
  optimal_lineups

}

#' Write Lineups to CSV
#'
#' Given the output from `[dk_get_optimal_lineups()]`, create a
#' CSV formatted for uplaod to \url{https://www.draftkings.com/lineup/upload}
#'
#' @importFrom rlang .data .env
#'
#' @param optimal_lineups Output from `[get_optimal_lineups()]`
#' @param file Path and name of the CSV file to create
dk_write_lineups_to_csv <- function(optimal_lineups, file = "lineups.csv") {

  purrr::map_dfr(optimal_lineups[1], function(.x) {

    dk_extract_solution(.x)$optimal_lineup %>%
      dplyr::transmute(
        "is_captain" = ifelse(.data$is_captain, "CPT1", paste0("FLEX", dplyr::row_number())),
        "value" = paste0(
          .data$first_name,
          " ",
          .data$last_name,
          " (",
          .data$draftable_id,
          ")"
        )
      ) %>%
      tidyr::pivot_wider(names_from = "is_captain",
                         values_from = "value")

    }

    ) %>%
    stats::setNames(c("CPT", rep("FLEX", 5))) %>%
    utils::write.csv(file = file, row.names = FALSE)

}

## Optimize ----------------------------------------------------------------------------------------

#' Optimize Lineup
#'
#' Get optimal players based on player pool, projected fantasy points,
#' and rules defined by a contest schematic.
#'
#' @param contest_schematic Output from `[prepare_contest_schematic()]` which
#'   includes information needed for optimization; including player info such as,
#'   news status, salary, and projected fantasy points.
#' @param ... Other arguments passed to optimization method.
#'
#' @export
dk_optimize_lineup <- function(contest_schematic, ...) {

  UseMethod("dk_optimize_lineup")

}

#' Optimize Showdown Captain Mode Contest Lineup
#'
#' Determine the optimal lineup of players based on the list of
#' available players, their salaries, and their projected
#' fantasy points for a showdown captain mode contest type.
#'
#' @inheritParams prepare_contest_schematic
#' @inheritParams dk_optimize_lineup
#' @importFrom rlang .data .env
#' @import ROI.plugin.glpk
#' @param max_points Optional upper threshold of points. This is used primarily
#'   to get many successive lineups in `[get_optimal_lineups()]`
#'
#' @method dk_optimize_lineup showdown_captain_mode
#' @export
dk_optimize_lineup.showdown_captain_mode <- function(contest_schematic, max_points = NULL, ...) {

  draft_group <- contest_schematic$draft_group
  rules <- contest_schematic$rules
  contest_id <- contest_schematic$contest_id

  mod <- ompr::MIPModel() %>%
    ompr::add_variable(draftable_id[i],
                       i = draft_group$row_number,
                       type = "binary") %>%
    ompr::set_objective(
      ompr::sum_over(draft_group$exp_fp[i] * draftable_id[i],
                     i = draft_group$row_number), "max"
    ) %>%
    # The sum of all player salaries must be less than salary cap max value
    ompr::add_constraint(
      ompr::sum_over(draft_group$salary[i] * draftable_id[i],
                     i = draft_group$row_number) <= rules$salary_cap_max_value
    )

  # Optionally set an upper bound on the number of expected fantasy points
  # This is used to get multiple lineups
  if (!is.null(max_points)) {

    mod <- mod %>%
      ompr::add_constraint(
        ompr::sum_over(draft_group$exp_fp[i] * draftable_id[i],
                       i = draft_group$row_number) <= max_points
      )

  }

  # Ensure both teams are present
  if (rules$team_count_min_value == 2) {

    mod <- mod %>%
      ompr::add_constraint(
        ompr::sum_over(draftable_id[i],
                       i = draft_group$row_number[which(draft_group$team_id == team_id)]) >= 1,
        team_id = unique(draft_group$team_id)
      )

  }

  # Ensure player is selected only once
  if (rules$unique_players) {

    mod <- mod %>%
      ompr::add_constraint(
        ompr::sum_over(draftable_id[i],
                       i = draft_group$row_number[which(draft_group$player_id == player_id)]) <= 1,
        player_id = draft_group$player_id
      )

  }

  # Ensure six players are selected
  mod <- mod %>%
    ompr::add_constraint(
      ompr::sum_over(
        draftable_id[i],
        i = draft_group$row_number
      ) == 6
    )

  # Ensure 1 captain
  mod <- mod %>%
    ompr::add_constraint(
      ompr::sum_over(draftable_id[i],
                     i = draft_group$row_number[which(draft_group$is_captain)]) == 1
    )


  solved_model <- ompr::solve_model(mod, ompr.roi::with_ROI(solver = "glpk"))

  out <- list(solved_model = solved_model,
              contest_schematic = contest_schematic)

  class(out) <- c("showdown_captain_mode_solution", class(out))

  out

}


## Print methods -----------------------------------------------------------------------------------


#' @method print showdown_captain_mode_solution
#' @export
print.showdown_captain_mode_solution <- function(x, ...) {

  print(dk_extract_solution(x))

}

#' @method print showdown_captain_mode_multiple_solutions
#' @export
print.showdown_captain_mode_multiple_solutions <- function(x, ...) {

  cli::cli_alert_success("Found {length(x)} showdown captain mode optimal lineup{?s}.")

}
