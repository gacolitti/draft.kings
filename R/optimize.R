
## Prep and extract  -------------------------------------------------------------------------------

#' Get Contest Schematic
#'
#' Retrieve contest player list and other information used in
#' optimization.
#'
#' @inheritParams get_contest_info
#'
#' @importFrom rlang .data .env
#'
#' @param player_df Object returned by `get_player_list()`. If `NULL` (the default),
#'   then this object is fetched using the `contest_id`.
#' @param players A vector of player IDs to include. If `NULL` (the default), then use
#'   all players found with `get_player_list()`.
#' @param rules Object returned by `get_gametype_rules()`. If `NULL` (the default),
#'   then this object is fetched using the `contest_id`.
#' @param exclude_players A vector of player IDs to exclude.
#' @param exclude_questionable Exclude players with statuses that indicate
#'   they will not play. These include players that are questionable,
#'   doubtful, out, and injured.
#'
#' @examples
#'   \dontrun{
#'     get_contest_schematic(contest_id = 133645678)
#'   }
#'
#' @export
get_contest_schematic <- function(contest_id,
                                  player_df = NULL,
                                  rules = NULL,
                                  players = NULL,
                                  exclude_players = NULL,
                                  exclude_questionable = TRUE) {

  players_intersect <- intersect(players, exclude_players)

  if (length(players_intersect) > 0) {

    cli::cli_abort(
        "You cannot include the same player IDs in `players` and `exclude_players`."
    )

  }

  if (is.null(rules)) {

    rules <- get_gametype_rules(contest_id = contest_id)

  }

  if (is.null(player_df)) {

    player_df <- get_player_list(contest_id = contest_id)

  }

  player_df <- player_df %>%
    dplyr::transmute(
      "player_id" = .data$pid,
      "first_name" = .data$fn,
      "last_name" = .data$ln,
      "salary" = .data$s,
      "fantasy_points" = as.numeric(.data$ppg),
      "team_id" = .data$tid,
      "status" = .data$i
    )

  if (exclude_questionable) {

    player_df <- player_df %>%
      dplyr::filter(.data$status == "")

  }

  if (!is.null(exclude_players)) {

    player_df <- player_df %>%
      dplyr::filter(
        !.data$player_id %in% .env$exclude_players
      )

  }

  if (!is.null(players)) {

    player_df <- player_df %>%
      dplyr::filter(
        .data$player_id %in% .env$players
      )

  }

  player_df <- player_df %>%
    dplyr::mutate("row_number" = dplyr::row_number())

  out <- list(players = player_df,
              rules = rules,
              contest_id = contest_id)

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
    ompr::get_solution(player[i, j]) %>%
    dplyr::filter(.data$value > 0) %>%
    dplyr::inner_join(solved_model$contest_schematic$players, by = c("i" = "row_number")) %>%
    dplyr::mutate(
      "salary" = ifelse(.data$j == 2, .data$salary * 1.5, .data$salary),
      "fantasy_points" = ifelse(.data$j == 2, .data$fantasy_points * 1.5, .data$fantasy_points)
    ) %>%
    dplyr::transmute(
      .data$player_id,
      .data$first_name,
      .data$last_name,
      "is_captain" = ifelse(.data$j == 2, TRUE, FALSE),
      .data$team_id,
      .data$fantasy_points,
      .data$salary,
      .data$status
    ) %>%
    dplyr::arrange(dplyr::desc(.data$is_captain))

  # Add draftable ID
  drafttable <- get_draftable_players(contest_id = solved_model$contest_schematic$contest_id)

  res <- res %>%
    dplyr::inner_join(
      drafttable %>%
        dplyr::select("player_id", "salary", "draftable_id"),
      by = c("player_id", "salary")
    )

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
#' @param contest_schematic Output from `[get_contest_schematic()]` which
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
#' @inheritParams get_contest_schematic
#' @inheritParams dk_optimize_lineup
#' @importFrom rlang .data .env
#' @import ROI.plugin.glpk
#' @param max_points Optional upper threshold of points. This is used primarily
#'   to get many successive lineups in `[get_optimal_lineups()]`
#'
#' @method dk_optimize_lineup showdown_captain_mode
#' @export
dk_optimize_lineup.showdown_captain_mode <- function(contest_schematic, max_points = NULL, ...) {

  players <- contest_schematic$players
  rules <- contest_schematic$rules
  contest_id <- contest_schematic$contest_id

  # Set max_points var if not passed
  if (is.null(max_points)) {

    max_points <- Inf

  }

  mod <- ompr::MIPModel() %>%
    ompr::add_variable(player[i, j], i = 1:nrow(players), j = 1:2, type = "binary") %>%
    ompr::set_objective(
      ompr::sum_over(players$fantasy_points[i] * player[i, 1] + players$fantasy_points[i] * 1.5 * player[i, 2],
                     i = 1:nrow(players)), "max"
    ) %>%
    # The sum of all player salaries must be less than salary cap max value
    ompr::add_constraint(
      ompr::sum_over(players$salary[i] * player[i, 1] + players$salary[i] * 1.5 * player[i, 2],
                     i = 1:nrow(players)) <= rules$salary_cap_max_value
    )

  # Optionally set an upper bound on the number of expected fantasy points
  # This is used to get multiple lineups
  if (!is.null(max_points)) {

    mod <- mod %>%
      ompr::add_constraint(
        ompr::sum_over(players$fantasy_points[i] * player[i, 1] + players$fantasy_points[i] * 1.5 * player[i, 2],
                       i = 1:nrow(players)) <= max_points
      )

  }

  # Ensure both teams are present
  if (rules$team_count_min_value == 2) {

    mod <- mod %>%
      ompr::add_constraint(
        ompr::sum_over(player[i, j], i = which(players$team_id == unique(players$team_id)[1]),
                       j = 1:2) >= 1
      ) %>%
      ompr::add_constraint(
        ompr::sum_over(player[i, j], i = which(players$team_id == unique(players$team_id)[2]),
                       j = 1:2) >= 1
      )

  }

  # Ensure player is selected only once
  if (rules$unique_players) {

    mod <- mod %>%
      ompr::add_constraint(
        ompr::sum_over(player[i, j], j = 1:2) <= 1, i = 1:nrow(players)
      )

  }

  # Ensure six players are selected
  mod <- mod %>%
    ompr::add_constraint(
      ompr::sum_over(player[i, j], j = 1:2, i = 1:nrow(players)) == 6
    )

  # Ensure 1 captain
  mod <- mod %>%
    ompr::add_constraint(
      ompr::sum_over(player[i, 2], i = 1:nrow(players)) == 1
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

  cat(cli::cli_text("Found {length(optimal_lineups)} showdown captain mode optimal lineup{?s}."))

}
