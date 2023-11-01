
httptest2::with_mock_dir("draftgroup", {

  test_that("dk_get_draft_group() works when passed a draftgroup ID", {

    d <- dk_get_draft_group(draft_group_id = 75367)

    expect_snapshot_value(d, style = "json2")

  })

  test_that("dk_get_draft_group() works when passed a contest ID", {

    d <- dk_get_draft_group(contest_key = 127252720)

    expect_snapshot_value(d, style = "json2")

  })

  test_that("dk_get_lobby_draft_groups() returns expected data", {

    d <- dk_get_lobby_draft_groups()

    expect_snapshot_value(d, style = "json2")

  })

  test_that("dk_get_draft_group_info() returns expected data", {

    d <- dk_get_draft_group_info(draft_group_id = 75367)

    expect_snapshot_value(d, style = "json2")

  })

  test_that("dk_get_draft_group_info2() returns expected data for single competition draft group", {

    d <- dk_get_draft_group_info2(draft_group_id = 75367)

    expect_snapshot_value(d, style = "json2")

  })

  test_that("dk_get_draft_group_info2() returns expected data for multi-competition draft group", {

    d <- dk_get_draft_group_info2(draft_group_id = 42994)

    expect_snapshot_value(d, style = "json2")

  })

  test_that("dk_get_player_list() returns expected data", {

    d <- dk_get_player_list(draft_group_id = 75367)

    expect_snapshot_value(d, style = "json2")

  })

  test_that("dk_get_team_list() returns expected data", {

    d <- dk_get_team_list(draft_group_id = 75367)

    expect_snapshot_value(d, style = "json2")

  })

  test_that("dk_get_player_fp() returns expected data", {

    d_nfl <- dk_get_player_fp(season = 2020, timeframe = 16, sport = "nfl")
    d_nba <- dk_get_player_fp(season = 2022, timeframe = 20230312, sport = "nba")

    expect_snapshot_value(d_nfl, style = "json2")

    expect_snapshot_value(d_nba, style = "json2")

  })

})
