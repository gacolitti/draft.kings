
#' Get Contest Schematic
#'
#' Retrieve contest player list and other information used in
#' optimization.
#'
#' @inheritParams get_contest_info
#'
#' @param exclude_players Optional list of full player names to exclude
#' @param exclude_questionable Exclude players with statuses that indicate
#'   they will not play. These include players that are questionable,
#'   doubtful, out, and injured.
#'
#' @export
get_contest_schematic <- function(contest_id,
                               exclude_players = NULL,
                               exclude_questionable = TRUE) {

  rules <- get_gametype_rules(contest_id = contest_id)

  players <- get_player_list(contest_id = contest_id) %>%
    dplyr::transmute(
      player_id = pid,
      first_name = fn,
      last_name = ln,
      salary = s,
      fppg = as.numeric(ppg),
      jersey_number = jn,
      position = pn,
      team_id = tid,
      news,
      status = i
    )

  if (exclude_questionable) {

    players <- players %>%
      dplyr::filter(status == "")

  }

  if (!is.null(exclude_players)) {

    players <- players %>%
      dplyr::filter(
        !paste(first_name, last_name) %in% !!exclude_players
      )

  }

  players <- players %>%
    dplyr::mutate(row_number = dplyr::row_number())

  list(players = players,
       rules = rules,
       contest_id = contest_id)

}


#' Optimize Player Lineup
#'
#' Determine the optimal lineup of players based on the list of
#' available players, their salaries, and their projected
#' fantasy points.
#'
#' @inheritParams get_contest_schematic
#' @param contest_schematic Output from `[get_contest_schematic()]` which
#'   includes information needed for optimization; including player info such as,
#'   news status, salary, and projected fantasy points.
#' @param max_points Optional upper threshold of points. This is used primarily
#'   to get many successive lineups in `[get_optimal_lineups()]`
optimize_lineup <- function(...,
                            contest_schematic = NULL,
                            contest_id = NULL,
                            max_points = NULL) {

  library(ROI.plugin.glpk)

  if (is.null(contest_schematic)) {

    contest_schematic <- get_contest_schematic(contest_id, ...)

  }

  players <- contest_schematic$players
  rules <- contest_schematic$rules
  contest_id <- contest_schematic$contest_id

  mod <- ompr::MIPModel() %>%
    ompr::add_variable(player[i, j], i = 1:nrow(players), j = 1:2, type = "binary") %>%
    ompr::set_objective(
      ompr::sum_over(players$fppg[i] * player[i, 1] + players$fppg[i] * 1.5 * player[i, 2],
               i = 1:nrow(players)), "max"
    ) %>%
    ompr::add_constraint(
      ompr::sum_over(players$salary[i] * player[i, 1] + players$salary[i] * 1.5 * player[i, 2],
               i = 1:nrow(players)) <= rules$salary_cap_max_value
    )

  # Optionally set an upper bound on the number of expected fantasy points
  # This is used to get multiple lineups
  if (!is.null(max_points)) {

    mod <- mod %>%
      ompr::add_constraint(
        ompr::sum_over(players$fppg[i] * player[i, 1] + players$fppg[i] * 1.5 * player[i, 2],
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


  mod_res <- mod %>%
    ompr::solve_model(ompr.roi::with_ROI(solver = "glpk"))

  res <- mod_res %>%
    ompr::get_solution(player[i, j]) %>%
    dplyr::filter(value > 0) %>%
    dplyr::inner_join(players, by = c("i" = "row_number")) %>%
    dplyr::mutate(salary = ifelse(j == 2, salary * 1.5, salary),
                  fppg = ifelse(j == 2, fppg * 1.5, fppg)) %>%
    dplyr::transmute(
      player_id,
      first_name,
      last_name,
      is_captain = ifelse(j == 2, TRUE, FALSE),
      team_id,
      fppg,
      salary,
      jersey_number,
      position,
      news,
      status
    ) %>%
    dplyr::arrange(dplyr::desc(is_captain))

  # Add draftable ID
  drafttable <- get_draftable_players(contest_id = contest_id)

  res <- res %>%
    dplyr::inner_join(
      drafttable %>%
        dplyr::select(player_id, salary, draftable_id),
      by = c("player_id", "salary")
    )

  list(
    optimal_lineup = res,
    salary = sum(res$salary),
    expected_points = ompr::objective_value(mod_res)
  )

}

#' Get Optimal Lineups
#'
#' Wrapper around `optimize_lineup()`. Can return an
#'   arbitrary number of optimal lineups in succession.
#'
#' @inheritParams optimize_lineup
#' @param n Number of lineups to return
#' @param tolerance The difference in fantasy points between the previous
#'   optimal lineup and the current optimal lineup during iterations.
#'   Usually the default of 0.001 is fine.
#'
#' @export
get_optimal_lineups <-function(contest_schematic = NULL,
                               contest_id = NULL,
                               n = 1,
                               exclude_players = NULL,
                               tolerance = 0.001) {

  optimal_lineups <- NULL
  max_points <- NULL

  for (i in 1:n) {

    if (!is.null(optimal_lineups)) {

      max_points <- optimal_lineups[[i - 1]]$expected_points - tolerance

    }

    optimal_lineups[[i]] <- optimize_lineup(
      contest_schematic = contest_schematic,
      contest_id = contest_id,
      max_points = max_points,
      exclude_players = exclude_players
    )

  }

  optimal_lineups

}

#' Write Lineups to CSV
#'
#' Given the output from `[get_optimal_lineups()]`, create a
#' CSV formatted for uplaod to \url{https://www.draftkings.com/lineup/upload}
#'
#' @param lineups Output from `[get_optimal_lineups()]`
#' @param file Path and name of the CSV file to create
write_lineups_to_csv <- function(lineups, file = "lineups.csv") {

  purrr::map_dfr(lineups, ~ .["optimal_lineup"][[1]], , .id = "id") %>%
    dplyr::group_by(id) %>%
    dplyr::mutate(is_captain = ifelse(is_captain, "CPT1", paste0("FLEX", dplyr::row_number()))) %>%
    dplyr::ungroup() %>%
    dplyr::transmute(id, is_captain,
                     value = paste0(first_name, " ", last_name, " (", draftable_id, ")")) %>%
    tidyr::pivot_wider(names_from = "is_captain",
                       values_from = "value") %>%
    dplyr::select(-id) %>%
    setNames(c("CPT", rep("FLEX", 5))) %>%
    write.csv(file = file, row.names = FALSE)


}


