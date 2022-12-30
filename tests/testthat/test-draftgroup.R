
httptest2::with_mock_dir("draftgroup", {

  test_that("get_draftable_players() works when passed a draftgroup ID", {

    d <- get_draftable_players(draft_group_id = 75367)

    expect_snapshot(d)

  })

  test_that("get_draftable_players() works when passed a contest ID", {

    d <- get_draftable_players(contest_id = 5915939)

    expect_snapshot(d)

  })

  test_that("get_draft_groups() returns expected data", {

    d <- get_draft_groups()

    expect_snapshot(d)

  })

  test_that("get_draft_group_info() returns expected data", {

    d <- get_draft_group_info(draft_group_id = 75367)

    expect_snapshot(d)

  })

  test_that("get_player_list() returns expected data", {

    d <- get_player_list(draft_group_id = 75367)

    expect_snapshot(d)

  })

  test_that("get_team_list() returns expected data", {

    d <- get_team_list(draft_group_id = 75367)

    expect_snapshot(d)

  })

  test_that("get_player_points() returns expected data", {

    d <- get_player_points(year = 2020, week = 16, sport = "nfl")

    expect_snapshot(d)

  })

})
