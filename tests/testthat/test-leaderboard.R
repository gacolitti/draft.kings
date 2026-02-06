
httptest2::with_mock_dir("leaderboard", {

  test_that("dk_get_leaderboard() works", {
    skip_if(nchar(Sys.getenv("DK_IV")) == 0 || nchar(Sys.getenv("DK_JWE")) == 0,
            "DK_IV and DK_JWE env vars required")
    d <- dk_get_leaderboard(133645678)
    testthat::expect_snapshot_value(d, style = "json2")
  })

  test_that("dk_get_entries() works", {
    skip_if(nchar(Sys.getenv("DK_IV")) == 0 || nchar(Sys.getenv("DK_JWE")) == 0,
            "DK_IV and DK_JWE env vars required")
    d <- dk_get_entries(draft_group_id = 80584, entry_keys = c(3618408508, 3618897002))
    testthat::expect_snapshot_value(d, style = "json2")
  })

})


