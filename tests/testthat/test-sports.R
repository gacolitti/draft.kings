httptest2::with_mock_dir("sports", {

  testthat::test_that("get_sports() returns expected results", {

    d <- get_sports()

    expect_equal(d$sport_id[1], 1)

  })

})
