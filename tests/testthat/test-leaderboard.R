
httptest2::with_mock_dir("leaderboard", {

  test_that("dk_get_leaderboard() works", {
    d <- dk_get_leaderboard(133645678)
    expect_snapshot(d)
  })

  test_that("dk_get_entries() works", {
    d <- dk_get_entries(draft_group_id = 80584, entry_keys = c(3618408508, 3618897002))
    expect_snapshot(d)
  })

})


