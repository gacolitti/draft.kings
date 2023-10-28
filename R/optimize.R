
## Prep and extract  -------------------------------------------------------------------------------

#' Prepare Schematic
#'
#' Combine information needed for optimization.
#' Passed to `dk_optimize()`.
#'
#' @inheritParams dk_get_draft_group
#'
#' @importFrom rlang .data .env
#'
#' @param draft_group Object returned by `get_draftable_players()`. If `NULL` (the default),
#'   then this object is fetched using the `draft_group_id`. The following columns are required:
#'    draftable_id, player_id, first_name, last_name, display_name, salary, team_id, status.
#' @param draft_group_exp_fp A data.frame with two columns `draftable_id`
#'   (found in the output of `get_draftable_players()`) and `exp_fp`
#'   (expected fantasy points). Note that the Showdown Captain Mode game type includes
#'   two rows for each player/defense. If `draft_group` contains rows not found in
#'   `draft_group_exp_fp`, then a warning is issued and those missing rows are dropped.
#'   If `NULL` (the default), and `exp_fp` does not exist in `draft_group`,
#'   then `exp_fp` is set equal to the `ppg` value returned by `get_player_list()`.
#' @param include_players A vector of player IDs to include. If `NULL` (the default), then use
#'   all players found with `get_draftable_players()`.
#' @param exclude_players A vector of player IDs to exclude.
#' @param rules Object returned by `get_gametype_rules()`. If `NULL` (the default),
#'   rules are fetched using the `draft_group_id`.
#' @param exclude_questionable Exclude players with statuses that indicate
#'   they will not play. These include players that are questionable,
#'   doubtful, out, and injured. Default is `FALSE`.
#'
#' @examples
#'   \dontrun{
#'     dk_prepare_schematic(draft_group_id = 80584)
#'   }
#'
#' @export
dk_prepare_schematic <- function(draft_group_id,
                                 draft_group_exp_fp = NULL,
                                 draft_group = NULL,
                                 rules = NULL,
                                 include_players = NULL,
                                 exclude_players = NULL,
                                 exclude_questionable = FALSE) {


  # Error if same players are included in `include_players` and `exclude_players`
  players_intersect <- intersect(include_players, exclude_players)
  if (length(players_intersect) > 0) {

    cli::cli_abort(
        "You cannot include the same player IDs in `include_players` and `exclude_players`."
    )

  }

  # Check for expected column names and types in rules
  if (!is.null(rules)) {

    check_df(
      rules,
      list(
        "salary_cap_max_value" = c("integer", "numeric"),
        "team_count_min_value" = c("integer", "numeric"),
        "unique_players"       = "logical"
      )
    )

  }

  # Check for expected column names in draft_group_exp_fp
  if (!is.null(draft_group_exp_fp)) {


    check_df(
      draft_group_exp_fp,
      list(
        "draftable_id" = c("integer", "numeric"),
        "exp_fp" = c("integer", "numeric")
      )
    )

  }

  # Check for expected column names in draft_group
  if (!is.null(draft_group)) {


    check_df(
      draft_group,
      list(
        "draftable_id" = c("integer", "numeric"),
        "player_id" = c("integer", "numeric"),
        "first_name" = c("character"),
        "last_name" = c("character"),
        "display_name" = c("character"),
        "salary" = c("integer", "numeric"),
        "team_id" = c("integer", "numeric"),
        "competition_id" = c("integer", "numeric"),
        "position" = c("character"),
        "status" = c("character")
      )
    )

  }

  # Fetch draft group info if rules, draft_group, or draft_group_exp_fp not passed
  if (is.null(rules) || is.null(draft_group) || is.null(draft_group_exp_fp)) {

    draft_group_info <- dk_get_draft_group_info(draft_group_id)$info

  }

  # Fetch rules if not passed
  if (is.null(rules)) {

    rules <- dk_get_game_type_rules(game_type_id = draft_group_info$game_type_id)

  }

  # Fetch draft group if not passed
  if (is.null(draft_group)) {

    draft_group <- dk_get_draft_group(draft_group_id)

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
  # if "exp_fp" column does not exist in draft_group
  # and draft_group_exp_fp is not passed. Otherwise,
  # join draft_group_exp_fp to draft_group
  if (is.null(draft_group$exp_fp)) {

    if (is.null(draft_group_exp_fp)) {

      player_list <- dk_get_player_list(draft_group_id) %>%
        dplyr::transmute("player_id" = .data$pid, "exp_fp" = as.numeric(.data$ppg))

      draft_group <- draft_group %>%
        dplyr::left_join(player_list, by = "player_id")

    } else {

      draft_group <- draft_group %>%
        dplyr::left_join(draft_group_exp_fp, by = "draftable_id")

    }

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

  # Remove duplicates in terms of everything but draftable_id
  draft_group <- draft_group %>%
    dplyr::distinct(dplyr::across(!dplyr::all_of("draftable_id")), .keep_all = TRUE)

  # Separate players that can perform multiple positions into different rows
  draft_group <- draft_group %>%
    tidyr::separate_rows(.data$position, sep = "/")

  # Add row number
  draft_group <- draft_group %>%
    dplyr::mutate("row_number" = dplyr::row_number())

  # Combine objects into list
  out <- list(draft_group = draft_group,
              rules = rules,
              draft_group_id = draft_group_id)

  # Add class based on game type found in rules
  class(out) <- c(clean_names(rules$game_type_name), class(out))

  out

}

#' Extract Solution
#'
#' Extract information from optimized lineup solution
#'
#' @param x Optimal lineup object created by [draft.kings::dk_optimize_lineup()].
#'
#' @export
dk_extract_solution <- function(x) {

  res <- x$solved_model %>%
    ompr::get_solution(draftable_id[i]) %>%
    dplyr::filter(.data$value > 0) %>%
    dplyr::inner_join(x$schematic$draft_group, by = c("i" = "row_number")) %>%
    dplyr::select(-dplyr::any_of(c("i", "value", "variable")))

  list(
    optimal_lineup = res,
    draft_group_id = x$schematic$draft_group_id,
    salary_total = sum(res$salary),
    exp_fp_total = ompr::objective_value(x$solved_model)
  )

}

#' Get Multiple Optimal Lineups
#'
#' Wrapper around [dk_optimize_lineup()]. Can return an
#' arbitrary number of optimal lineups in succession.
#'
#' @inheritParams dk_optimize_lineup
#' @param n Number of lineups to return.
#' @param tolerance The difference in fantasy points between the previous
#'   optimal lineup and the current optimal lineup during iterations.
#'   Usually the default of 0.001 is fine.
#'
#' @export
dk_get_optimal_lineups <-function(schematic,
                                  n = 1,
                                  tolerance = 0.001) {

  optimal_lineups <- NULL
  max_points <- NULL

  for (i in 1:n) {

    if (!is.null(optimal_lineups)) {

      max_points <- optimal_lineups[[i - 1]]$solved_model$objective_value - tolerance

    }

    optimal_lineups[[i]] <- dk_optimize_lineup(
      schematic = schematic,
      max_points = max_points
    )

  }

  optimal_lineups <- stats::setNames(optimal_lineups, paste0("solution_",
                                                             seq_len(length(optimal_lineups))))

  class(optimal_lineups) <- c(
    paste0(clean_names(schematic$rules$game_type_name), "_multiple_solutions"),
    class(optimal_lineups)
  )
  optimal_lineups

}

## Optimize Methods --------------------------------------------------------------------------------

#' Optimize Lineup
#'
#' Get optimal players based on player pool, projected fantasy points,
#' and rules defined by a schematic. See [dk_prepare_schematic()].
#'
#' @param schematic Output from [dk_prepare_schematic()] which
#'   includes information needed for optimization; including player info such as,
#'   news status, salary, and projected fantasy points.
#' @param max_points Optional upper threshold of points. This is used primarily
#'   to get many successive lineups in [dk_get_optimal_lineups()]
#' @param ... Other arguments passed to optimization method.
#'
#' @inheritParams ompr.roi::with_ROI
#'
#' @export
dk_optimize_lineup <- function(schematic, max_points, solver = "glpk", ...) {

  check_solver(solver)

  UseMethod("dk_optimize_lineup")

}


#' Optimize Showdown Captain Mode Game Type Lineup
#'
#' Determine the optimal lineup of players based on the list of
#' available players, their salaries, and their projected
#' fantasy points for a showdown captain mode game type.
#'
#' @importFrom rlang .data .env
#'
#' @rdname dk_optimize_lineup
#' @method dk_optimize_lineup showdown_captain_mode
#' @export
dk_optimize_lineup.showdown_captain_mode <- function(schematic, max_points = NULL, solver = "glpk", ...) {

  draft_group <- schematic$draft_group
  rules <- schematic$rules
  draft_group_id <- schematic$draft_group_id

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


  solved_model <- ompr::solve_model(mod, ompr.roi::with_ROI(solver = solver, ...))

  out <- list(solved_model = solved_model,
              schematic = schematic)

  class(out) <- c("showdown_captain_mode_solution", class(out))

  out

}

#' Optimize Classic Game Type Lineup
#'
#' Determine the optimal lineup of players based on the list of
#' available players, their salaries, and their projected
#' fantasy points for a classic game type.
#'
#' @importFrom rlang .data .env
#'
#' @rdname dk_optimize_lineup
#' @method dk_optimize_lineup classic
#' @export
dk_optimize_lineup.classic <- function(schematic, max_points = NULL, solver = "glpk", ...) {

  draft_group <- schematic$draft_group
  rules <- schematic$rules
  draft_group_id <- schematic$draft_group_id

  if (!rules$game_type_id %in% c(70, 1)) {

    cli::cli_abort(
      "Game type {rules$game_type_id} associated with draft group ID {draft_group_id} is not supported"
    )

  }

  mod <- ompr::MIPModel() %>%

    ompr::add_variable(draftable_id[i],
                       i = draft_group$row_number,
                       type = "binary") %>%

    ompr::add_variable(competition_id[j],
                       j = unique(draft_group$competition_id),
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

  # Ensure at least two competitions are present
  if (!is.na(rules$game_count_min_value)) {

    mod <- mod %>%
      # force group binary variables to be 1 if item is in group
      ompr::add_constraint(
        ompr::sum_over(
          draftable_id[i],
          i = draft_group$row_number[which(draft_group$competition_id == j)]
        ) - 10000 * competition_id[j] <= 0,
        j = unique(draft_group$competition_id)
      ) %>%

      # force at least one binary variable for item inclusion to be 1 for all items in group
      # if group binary is 1
      ompr::add_constraint(
        competition_id[j] - 10000 * ompr::sum_over(
          draftable_id[i],
          i = draft_group$row_number[which(draft_group$competition_id == j)]
        ) <= 0,
        j = unique(draft_group$competition_id)
      ) %>%

      # force at least two competitions
      ompr::add_constraint(
        ompr::sum_over(
          competition_id[j],
          j = unique(draft_group$competition_id)
        ) >= 2
      )

  }

  # Ensure player is selected max one time
  if (rules$unique_players) {

    mod <- mod %>%
      ompr::add_constraint(
        ompr::sum_over(draftable_id[i],
                       i = draft_group$row_number[which(draft_group$player_id == player_id)]) <= 1,
        player_id = draft_group$player_id
      )

  }

  # Set player constraints for NBA classic
  if (rules$game_type_id == 70) {

    # Ensure at least 1 player in each position
    mod <- mod %>%
      ompr::add_constraint(
        ompr::sum_over(
          draftable_id[i],
          i = draft_group$row_number[which(draft_group$position == position)]
        ) >= 1,
        position = unique(draft_group$position)
      )

    # Ensure 8 players (allows for one flex that can come from any position)
    mod <- mod %>%
      ompr::add_constraint(
        ompr::sum_over(
          draftable_id[i],
          i = draft_group$row_number
        ) == 8
      )

  }

  # Set player constraints for NFL classic
  if (rules$game_type_id == 1) {

    # Ensure 1 QB, 1 DST
    mod <- mod %>%
      ompr::add_constraint(
        ompr::sum_over(
          draftable_id[i],
          i = draft_group$row_number[which(draft_group$position == position)]
        ) == 1,
        position = c("QB", "DST")
      )

    # Ensure at least 3 WR
    mod <- mod %>%
      ompr::add_constraint(
        ompr::sum_over(
          draftable_id[i],
          i = draft_group$row_number[which(draft_group$position == position)]
        ) >= 3,
        position = "WR"
      )

    # Ensure at least 2 RB
    mod <- mod %>%
      ompr::add_constraint(
        ompr::sum_over(
          draftable_id[i],
          i = draft_group$row_number[which(draft_group$position == position)]
        ) >= 2,
        position = "RB"
      )

    # Ensure at least 1 TE
    mod <- mod %>%
      ompr::add_constraint(
        ompr::sum_over(
          draftable_id[i],
          i = draft_group$row_number[which(draft_group$position == position)]
        ) >= 1,
        position = "TE"
      )

    # Ensure 9 players (allows for one flex which can be either RB/WR/TE)
    mod <- mod %>%
      ompr::add_constraint(
        ompr::sum_over(
          draftable_id[i],
          i = draft_group$row_number
        ) == 9
      )

  }

  solved_model <- ompr::solve_model(mod, ompr.roi::with_ROI(solver = solver, ...))

  out <- list(solved_model = solved_model,
              schematic = schematic)

  class(out) <- c("classic_solution", class(out))

  out

}


## Print methods -----------------------------------------------------------------------------------


#' @method print classic_solution
#' @export
print.classic_solution <- function(x, ...) {

  print(dk_extract_solution(x))

}


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

#' @method print classic_multiple_solutions
#' @export
print.classic_multiple_solutions <- function(x, ...) {

  cli::cli_alert_success("Found {length(x)} classic optimal lineup{?s}.")

}

# CSV Methods --------------------------------------------------------------------------------------

#' Write Lineups to CSV
#'
#' Create CSV of optimal lineups that can be uploaded to
#' \url{https://www.draftkings.com/lineup/upload}.
#'
#' @param optimal_lineups Output from [dk_get_optimal_lineups()]
#' @param file Path and name of the CSV file to create
#' @param ... Other args passed to [utils::write.csv()]
#'
#' @export
dk_write_csv <- function(optimal_lineups, file, ...) {

  UseMethod("dk_write_csv")

}

#' Write Showdown Captain Mode Lineups to CSV
#'
#' Given the output from [dk_get_optimal_lineups()], create a
#' CSV of Showdown Captain Mode lineups formatted for
#' uplaod to \url{https://www.draftkings.com/lineup/upload}.
#'
#' @importFrom rlang .data .env
#'
#' @rdname dk_write_csv
#' @method dk_write_csv showdown_captain_mode_multiple_solutions
#' @export
dk_write_csv.showdown_captain_mode_multiple_solutions <- function(
    optimal_lineups,
    file = "showdown_captain_mode_lineups.csv",
    ...
  ) {

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
    utils::write.csv(file = file, row.names = FALSE, ...)

}
