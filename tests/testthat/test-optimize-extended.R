## Extended optimize tests --------------------------------------------------
## Tests for dk_get_optimal_lineups(), dk_extract_solution(), dk_write_csv(),
## print methods, and dk_prepare_schematic() edge cases.

## dk_extract_solution() ---------------------------------------------------

httptest2::with_mock_dir("optimize", {

  test_that("dk_extract_solution() returns expected structure for showdown", {
    skip_if_not_installed("ROI.plugin.glpk")
    schematic <- dk_prepare_schematic(75284)
    solution <- dk_optimize_lineup(schematic)
    extracted <- dk_extract_solution(solution)

    expect_type(extracted, "list")
    expect_named(extracted, c("optimal_lineup", "draft_group_id", "salary_total", "exp_fp_total"))
    expect_s3_class(extracted$optimal_lineup, "data.frame")
    expect_equal(nrow(extracted$optimal_lineup), 6)
    expect_equal(extracted$draft_group_id, 75284)
    expect_true(extracted$salary_total > 0)
    expect_true(extracted$exp_fp_total > 0)
  })

  test_that("dk_extract_solution() returns expected structure for classic", {
    skip_if_not_installed("ROI.plugin.glpk")
    schematic <- dk_prepare_schematic(74625)
    solution <- dk_optimize_lineup(schematic)
    extracted <- dk_extract_solution(solution)

    expect_type(extracted, "list")
    expect_s3_class(extracted$optimal_lineup, "data.frame")
    expect_equal(nrow(extracted$optimal_lineup), 9)
    expect_equal(extracted$draft_group_id, 74625)
  })

})

## dk_get_optimal_lineups() ------------------------------------------------

httptest2::with_mock_dir("optimize", {

  test_that("dk_get_optimal_lineups() returns multiple showdown lineups", {
    skip_if_not_installed("ROI.plugin.glpk")
    schematic <- dk_prepare_schematic(75284)
    lineups <- dk_get_optimal_lineups(schematic, n = 2)

    expect_type(lineups, "list")
    expect_length(lineups, 2)
    expect_named(lineups, c("solution_1", "solution_2"))
    expect_true("showdown_captain_mode_multiple_solutions" %in% class(lineups))

    # Second lineup should have lower or equal points
    pts1 <- ompr::objective_value(lineups$solution_1$solved_model)
    pts2 <- ompr::objective_value(lineups$solution_2$solved_model)
    expect_true(pts1 >= pts2)
  })

  test_that("dk_get_optimal_lineups() returns multiple classic lineups", {
    skip_if_not_installed("ROI.plugin.glpk")
    schematic <- dk_prepare_schematic(74625)
    lineups <- dk_get_optimal_lineups(schematic, n = 2)

    expect_type(lineups, "list")
    expect_length(lineups, 2)
    expect_true("classic_multiple_solutions" %in% class(lineups))
  })

})

## print methods -----------------------------------------------------------

httptest2::with_mock_dir("optimize", {

  test_that("print.showdown_captain_mode_multiple_solutions works", {
    skip_if_not_installed("ROI.plugin.glpk")
    schematic <- dk_prepare_schematic(75284)
    lineups <- dk_get_optimal_lineups(schematic, n = 2)
    expect_output(print(lineups), "showdown captain mode")
  })

  test_that("print.classic_multiple_solutions works", {
    skip_if_not_installed("ROI.plugin.glpk")
    schematic <- dk_prepare_schematic(74625)
    lineups <- dk_get_optimal_lineups(schematic, n = 1)
    expect_output(print(lineups), "classic")
  })

})

## dk_write_csv() ----------------------------------------------------------

httptest2::with_mock_dir("optimize", {

  test_that("dk_write_csv() writes a valid showdown CSV", {
    skip_if_not_installed("ROI.plugin.glpk")
    schematic <- dk_prepare_schematic(75284)
    lineups <- dk_get_optimal_lineups(schematic, n = 1)

    tmp <- tempfile(fileext = ".csv")
    on.exit(unlink(tmp), add = TRUE)

    dk_write_csv(lineups, file = tmp)
    expect_true(file.exists(tmp))

    csv <- utils::read.csv(tmp)
    expect_equal(ncol(csv), 6)
    expect_equal(nrow(csv), 1)
    expect_true("CPT" %in% colnames(csv))
  })

})

## dk_optimize_lineup.classic() error paths --------------------------------

httptest2::with_mock_dir("optimize", {

  test_that("dk_optimize_lineup.classic() errors on unsupported game type", {
    skip_if_not_installed("ROI.plugin.glpk")
    schematic <- dk_prepare_schematic(74625)
    # Modify the game_type_id to an unsupported value
    schematic$rules$game_type_id <- 999
    expect_error(
      dk_optimize_lineup(schematic),
      "not supported"
    )
  })

})

## dk_prepare_schematic() edge cases (with mocked HTTP) --------------------

httptest2::with_mock_dir("optimize", {

  test_that("dk_prepare_schematic() with exclude_players filters players", {
    skip_if_not_installed("ROI.plugin.glpk")
    # First get baseline count
    schematic_all <- dk_prepare_schematic(75284)
    n_all <- nrow(schematic_all$draft_group)

    # Get one player ID to exclude
    pid <- schematic_all$draft_group$player_id[1]
    schematic_excl <- dk_prepare_schematic(75284, exclude_players = pid)
    n_excl <- nrow(schematic_excl$draft_group)

    expect_true(n_excl < n_all)
    expect_false(pid %in% schematic_excl$draft_group$player_id)
  })

  test_that("dk_prepare_schematic() with include_players limits players", {
    skip_if_not_installed("ROI.plugin.glpk")
    schematic_all <- dk_prepare_schematic(75284)
    pids <- schematic_all$draft_group$player_id[1:6]

    schematic_incl <- dk_prepare_schematic(75284, include_players = pids)
    expect_true(all(schematic_incl$draft_group$player_id %in% pids))
  })

  test_that("dk_prepare_schematic() with exclude_questionable filters statuses", {
    skip_if_not_installed("ROI.plugin.glpk")
    schematic <- dk_prepare_schematic(75284, exclude_questionable = TRUE)
    statuses <- unique(schematic$draft_group$status)
    expect_true(all(statuses == "None"))
  })

  test_that("dk_prepare_schematic() with custom draft_group_exp_fp joins correctly", {
    skip_if_not_installed("ROI.plugin.glpk")
    schematic_base <- dk_prepare_schematic(75284)
    draftable_ids <- schematic_base$draft_group$draftable_id

    custom_fp <- data.frame(
      draftable_id = draftable_ids,
      exp_fp = rep(10.0, length(draftable_ids))
    )

    # Need to pass draft_group without exp_fp for the join to happen
    # Get a raw draft group to pass with custom exp_fp
    dg <- dk_get_draft_group(75284)
    rules <- dk_get_game_type_rules(game_type_id = schematic_base$rules$game_type_id)

    schematic_custom <- dk_prepare_schematic(
      75284,
      draft_group = dg,
      draft_group_exp_fp = custom_fp,
      rules = rules
    )
    # All exp_fp values should be 10 (or 15 for captain due to 1.5x multiplier)
    base_fp <- schematic_custom$draft_group$exp_fp[!schematic_custom$draft_group$is_captain]
    expect_true(all(base_fp == 10.0))
  })

  test_that("dk_prepare_schematic() warns on missing draftable IDs in exp_fp", {
    skip_if_not_installed("ROI.plugin.glpk")
    # Pass a partial exp_fp that doesn't cover all draftable IDs
    dg <- dk_get_draft_group(75284)
    rules <- dk_get_game_type_rules(game_type_id = 159)

    partial_fp <- data.frame(
      draftable_id = dg$draftable_id[1:2],
      exp_fp = c(5.0, 6.0)
    )

    expect_warning(
      dk_prepare_schematic(
        75284,
        draft_group = dg,
        draft_group_exp_fp = partial_fp,
        rules = rules
      ),
      "draftable IDs"
    )
  })

  test_that("dk_prepare_schematic() validates custom rules columns", {
    bad_rules <- data.frame(bad_col = 1)
    expect_error(
      dk_prepare_schematic(75284, rules = bad_rules),
      "Missing required columns"
    )
  })

  test_that("dk_prepare_schematic() validates custom draft_group_exp_fp columns", {
    bad_fp <- data.frame(wrong_col = 1)
    expect_error(
      dk_prepare_schematic(75284, draft_group_exp_fp = bad_fp),
      "Missing required columns"
    )
  })

  test_that("dk_prepare_schematic() validates custom draft_group columns", {
    bad_dg <- data.frame(wrong_col = 1)
    expect_error(
      dk_prepare_schematic(75284, draft_group = bad_dg),
      "Missing required columns"
    )
  })

})
