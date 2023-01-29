

httptest2::with_mock_dir("contest", {

  test_that("dk_get_contest_info() returns expected results for contest ID 9000", {

    d <- dk_get_contest_info(9000)

    expect_equal(d$contest_key, "9000")

  })

  test_that("dk_get_lobby_contests() returns expected results", {

    d <- dk_get_lobby_contests()

    expect_snapshot(d)

  })

  test_that("dk_get_game_type_rules() returns expected results", {

    d <- dk_get_game_type_rules(159)

    expect_equal(d$game_type_id, 159)

  })

  test_that("dk_get_lobby_game_types() returns expected results", {

    d <- dk_get_lobby_game_types()

    expect_snapshot(d)

  })

})
