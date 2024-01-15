
# Register the solver
check_solver("glpk")

httptest2::with_mock_dir("optimize", {

  test_that(
    "dk_optimize_lineup() returns results for NFL Showdown Captain Mode",
    {
      # NFL showdown contest
      schematic <- dk_prepare_schematic(75284)
      solution <- dk_optimize_lineup(schematic)
      testthat::expect_snapshot(solution)

    }
  )

  test_that(
    "dk_optimize_lineup() returns results for NFL Classic Game Type",
    {
      # NFL classic contest
      schematic <- dk_prepare_schematic(74625)
      solution <- dk_optimize_lineup(schematic)
      testthat::expect_snapshot(solution)
    }
  )

  test_that(
    "dk_optimize_lineup() returns results for NBA Showdown Captain Mode",
    {
      # NFL showdown contest
      schematic <- dk_prepare_schematic(94770)
      solution <- dk_optimize_lineup(schematic)
      testthat::expect_snapshot(solution)

    }
  )

  test_that(
    "dk_optimize_lineup() returns results for NBA Classic Game Type",
    {
      # NFL classic contest
      schematic <- dk_prepare_schematic(94768)
      solution <- dk_optimize_lineup(schematic)
      testthat::expect_snapshot(solution)
    }
  )


})

