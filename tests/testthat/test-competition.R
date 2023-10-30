httptest2::with_mock_dir("competition", {

  test_that("dk_get_competitions() returns expected results for Classic NFL game type", {

    d <- dk_get_competitions(draft_group_id = 42994)

    testthat::expect_snapshot(d)

  })

  test_that("dk_get_competitions() returns expected results for Showdown NFL game type", {

    d <- dk_get_competitions(draft_group_id = 75284)

    testthat::expect_snapshot(d)

  })

})
