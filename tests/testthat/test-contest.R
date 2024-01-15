

httptest2::with_mock_dir("contest", {

  test_that("dk_get_contest_info() returns expected results for contest ID 9000", {

    d <- dk_get_contest_info(9000)

    expect_equal(d$contest_key, "9000")

  })

  test_that("dk_get_lobby_contests() returns expected results", {

    d <- dk_get_lobby_contests()

    expected_names <- c("uc", "ec", "maximum_entries_per_user", "frequent_player_points", "s",
                        "name", "entries", "maximum_entries", "entry_fee", "total_payouts",
                        "tickets", "start_time_string", "contest_start_time", "contest_key",
                        "tmpl", "pt", "so", "fwt", "is_owner", "start_time_type", "draft_group_id",
                        "ulc", "contest_status", "game_type", "ssd", "dgpo", "cso", "ir", "rl",
                        "rlc", "rll", "sa", "free_with_crowns", "crown_amount", "is_bonus_finalized",
                        "is_snake_draft", "attr_is_guaranteed", "attr_lobby_class", "attr_is_starred",
                        "pd_cash", "pd_contest_seat", "attr_is_tournament_of_champ",
                        "attr_is_qualifier", "pd_live_final_seat", "attr_is_winner_take_all",
                        "attr_league", "attr_hide_branded_logo", "attr_is_double_up",
                        "attr_is_fiftyfifty", "attr_is_headliner", "attr_is_nighttime",
                        "pd_ticket", "attr_is_casual", "attr_multiplier", "attr_is_beginner")
    expect_in(names(d), expected_names)

  })

  test_that("dk_get_game_type_rules() returns expected results", {

    d <- dk_get_game_type_rules(159)

    expect_equal(d$game_type_id, 159)

  })

  test_that("dk_get_lobby_game_types() returns expected results", {

    d <- dk_get_lobby_game_types()

    expected_names <- c("game_type_id", "name", "description", "tag", "sport_id", "draft_type", "is_season_long", "game_style_id", "game_style_sport_id", "game_style_sort_order", "game_style_name", "game_style_abbreviation", "game_style_description", "game_style_is_enabled", "game_style_attributes")
    expect_in(names(d), expected_names)

  })

})
