
httptest2::with_mock_dir("dk_get", {

  test_that("dk_get() works with dk_get_contest_info", {
    d <- dk_get(dk_get_contest_info, c(67260593, 67116261))

    testthat::expect_equal(
      names(d),
      c("key", "request", "response", "json", "cleaned_json",
        "status", "error_message", "error_output")
    )

    testthat::expect_s3_class(d, "tbl_df")

    testthat::expect_true(all(d$status == 200))

  })

  test_that("dk_get() works with dk_get_leaderboard", {
    d <- dk_get(dk_get_leaderboard, c(67260593, 67116261))

    testthat::expect_equal(
      names(d),
      c("key", "request", "response", "json", "cleaned_json",
        "status", "error_message", "error_output")
    )

    testthat::expect_s3_class(d, "tbl_df")

    testthat::expect_true(all(d$status == 200))

  })

  test_that("dk_get() works with invalid contest keys", {
    testthat::expect_warning(
      d <- dk_get(dk_get_leaderboard, c(67260593, 67116261, 5),
                retry_options = list(max_tries = 1)),
      "did not have a 200 status code"
    )

    testthat::expect_equal(
      names(d),
      c("key", "request", "response", "json", "cleaned_json",
        "status", "error_message", "error_output")
    )

    testthat::expect_s3_class(d, "tbl_df")

  })

})


