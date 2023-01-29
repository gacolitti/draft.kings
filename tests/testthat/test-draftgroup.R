
httptest2::with_mock_dir("draftgroup", {

  test_that("dk_get_draft_group() works when passed a draftgroup ID", {

    d <- dk_get_draft_group(draft_group_id = 75367)

    expect_snapshot(d)

  })

  test_that("dk_get_draft_group() works when passed a contest ID", {

    d <- dk_get_draft_group(contest_key = 5915939)

    expect_snapshot(d)

  })

  test_that("dk_get_lobby_draft_groups() returns expected data", {

    d <- dk_get_lobby_draft_groups()

    expect_snapshot(d)

  })

  test_that("dk_get_draft_group_info() returns expected data", {

    d <- dk_get_draft_group_info(draft_group_id = 75367)

    expect_snapshot(d)

  })

  test_that("dk_get_player_list() returns expected data", {

    d <- dk_get_player_list(draft_group_id = 75367)

    expect_snapshot(d)

  })

  test_that("dk_get_team_list() returns expected data", {

    d <- dk_get_team_list(draft_group_id = 75367)

    expect_snapshot(d)

  })

  test_that("dk_get_player_fp() returns expected data", {

    d <- dk_get_player_fp(year = 2020, week = 16, sport = "nfl")

    expect_snapshot(d)

  })

})
