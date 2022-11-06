

httptest2::with_mock_dir("contest", {

  testthat::test_that("get_contest_info() returns expected results for contest ID 9000", {

    d <- get_contest_info(9000)

    testthat::expect_snapshot(d)

  })

})
