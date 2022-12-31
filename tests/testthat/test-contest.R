

httptest2::with_mock_dir("contest", {

  testthat::test_that("get_contest_info() returns expected results for contest ID 9000", {

    d <- get_contest_info(9000)

    expect_equal(d$contest_key, "9000")

  })

  testthat::test_that("get_contests() returns expected results", {

    d <- get_contests()

    testthat::expect_snapshot(d)

  })

  testthat::test_that("get_gametype_rules() returns expected results", {

    d <- get_gametype_rules(159)

    expect_equal(d$game_type_id, 159)

  })

  testthat::test_that("get_game_types() returns expected results", {

    d <- get_game_types()

    expect_snapshot(d)

  })

})
