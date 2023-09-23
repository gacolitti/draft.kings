
httptest2::with_mock_dir("draftgroup", {

  test_that("dk_get_draft_group() works when passed a draftgroup ID", {

    d <- dk_get_draft_group(draft_group_id = 75367)

    set.seed(1)
    d_sampled <- d |> dplyr::slice_sample(n = 5)
    expect_snapshot(dplyr::glimpse(d_sampled, 200))

  })

  test_that("dk_get_draft_group() works when passed a contest ID", {

    d <- dk_get_draft_group(contest_key = 5915939)

    set.seed(1)
    d_sampled <- d |> dplyr::slice_sample(n = 5)
    expect_snapshot(dplyr::glimpse(d_sampled, 200))

  })

  test_that("dk_get_lobby_draft_groups() returns expected data", {

    d <- dk_get_lobby_draft_groups()

    set.seed(1)
    d_sampled <- d |> dplyr::slice_sample(n = 5)
    expect_snapshot(dplyr::glimpse(d_sampled, 200))

  })

  test_that("dk_get_draft_group_info() returns expected data", {

    d <- dk_get_draft_group_info(draft_group_id = 75367)

    expect_snapshot(dplyr::glimpse(d, 200))

  })

  test_that("dk_get_player_list() returns expected data", {

    d <- dk_get_player_list(draft_group_id = 75367)

    set.seed(1)
    d_sampled <- d |> dplyr::slice_sample(n = 5)
    expect_snapshot(dplyr::glimpse(d_sampled, 200))

  })

  test_that("dk_get_team_list() returns expected data", {

    d <- dk_get_team_list(draft_group_id = 75367)

    set.seed(1)
    d_sampled <- d |> dplyr::slice_sample(n = 5)
    expect_snapshot(dplyr::glimpse(d_sampled, 200))

  })

  test_that("dk_get_player_fp() returns expected data", {

    d_nfl <- dk_get_player_fp(season = 2020, timeframe = 16, sport = "nfl")
    d_nba <- dk_get_player_fp(season = 2022, timeframe = 20230312, sport = "nba")

    set.seed(1)
    d_sampled <- d_nfl |> dplyr::slice_sample(n = 5)
    expect_snapshot(dplyr::glimpse(d_sampled, 200))

    set.seed(1)
    d_sampled <- d_nba |> dplyr::slice_sample(n = 5)
    expect_snapshot(dplyr::glimpse(d_sampled, 200))

  })

})
