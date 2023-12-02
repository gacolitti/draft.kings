
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

    expected_names <- c("draft_group_id", "contest_type_id", "start_date", "start_date_est",
                        "sort_order", "draft_group_tag", "game_type_id", "game_type",
                        "sport_sort_order", "sport", "game_count", "contest_start_time_suffix",
                        "contest_start_time_type", "games", "draft_group_series_id",
                        "game_set_key", "allowugc")
    expect_in(names(d), expected_names)

  })

  test_that("dk_get_draft_group_info() returns expected data", {

    d <- dk_get_draft_group_info(draft_group_id = 75367)

    expect_snapshot_value(d, style = "json2")

  })

  test_that("dk_get_draft_group_info2() returns expected data for single competition draft group", {

    d <- dk_get_draft_group_info2(draft_group_ids = 75367)

    expect_snapshot_value(d, style = "json2")

  })

  test_that("dk_get_draft_group_info2() returns expected data for multi-competition draft group", {

    d <- dk_get_draft_group_info2(draft_group_ids = 42994)

    expect_snapshot_value(d, style = "json2")

  })

  test_that("dk_get_draft_group_info2() returns expected data for multiple draft groups", {

    d <- dk_get_draft_group_info2(draft_group_ids = c(75367, 24180))

    expect_snapshot_value(d, style = "json2")

  })

  test_that("dk_get_player_list() returns expected data", {

    d <- dk_get_player_list(draft_group_id = 75367)

    expected_names <- c("player_id", "did", "pcode", "competition_id", "first_name", "last_name",
                        "first_name_duplicate", "last_name_duplicate", "jersey_number", "position",
                        "competition_start_time", "team_id", "home_team_id", "away_team_id",
                        "home_team_abbreviation", "away_team_abbreviation", "position_id",
                        "roster_slot_id", "slo", "is_disabled", "salary", "points_per_game",
                        "own_rate", "is_swappable", "in_play_contest", "pp", "injury_status",
                        "news_code", "large_image_url", "alternate_large_image_url",
                        "small_image_url", "alternate_small_image_url")
    expect_in(names(d), expected_names)

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
