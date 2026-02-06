httptest2::with_mock_dir("optimize", {

  test_that(
    "dk_optimize_lineup() returns results for NFL Showdown Captain Mode",
    {
      skip_if_not_installed("ROI.plugin.glpk")
      # NFL showdown contest
      schematic <- dk_prepare_schematic(75284)
      solution <- dk_optimize_lineup(schematic)
      testthat::expect_snapshot(solution)

    }
  )

  test_that(
    "dk_optimize_lineup() returns results for NFL Classic Game Type",
    {
      skip_if_not_installed("ROI.plugin.glpk")
      # NFL classic contest
      schematic <- dk_prepare_schematic(74625)
      solution <- dk_optimize_lineup(schematic)
      testthat::expect_snapshot(solution)
    }
  )

  test_that(
    "dk_optimize_lineup() returns results for NBA Showdown Captain Mode",
    {
      skip_if_not_installed("ROI.plugin.glpk")
      # NBA showdown contest
      schematic <- dk_prepare_schematic(94770)
      solution <- dk_optimize_lineup(schematic)
      testthat::expect_snapshot(solution)

    }
  )

  test_that(
    "dk_optimize_lineup() returns results for NBA Classic Game Type",
    {
      skip_if_not_installed("ROI.plugin.glpk")
      # NBA classic contest
      schematic <- dk_prepare_schematic(94768)
      solution <- dk_optimize_lineup(schematic)
      testthat::expect_snapshot(solution)
    }
  )


})

