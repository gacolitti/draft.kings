## Error path tests for functions that abort before making HTTP requests ----
## These don't need httptest2 mocking since they fail before any request.

## check_draft_group_id() --------------------------------------------------

test_that("check_draft_group_id() errors when both args are NULL", {
  expect_error(
    check_draft_group_id(NULL, NULL),
    "cannot both be missing"
  )
})

test_that("check_draft_group_id() returns draft_group_id when provided", {
  expect_equal(check_draft_group_id(12345, NULL), 12345)
})

## dk_get_game_type_rules() ------------------------------------------------

test_that("dk_get_game_type_rules() errors when both args are NULL", {
  expect_error(
    dk_get_game_type_rules(game_type_id = NULL, contest_key = NULL),
    "cannot both be missing"
  )
})

## dk_get_contest_info() ---------------------------------------------------

test_that("dk_get_contest_info() errors on non-numeric contest_key", {
  expect_error(
    dk_get_contest_info("abc"),
    "is.numeric"
  )
})

## dk_get_leaderboard() / dk_get_entries() ---------------------------------

test_that("dk_get_leaderboard() errors when cookies are missing", {
  expect_error(
    dk_get_leaderboard(12345, iv = "", jwe = ""),
    "cookies are required"
  )
})

test_that("dk_get_leaderboard() errors when only iv is missing", {
  expect_error(
    dk_get_leaderboard(12345, iv = "", jwe = "some_value"),
    "cookies are required"
  )
})

test_that("dk_get_entries() errors when cookies are missing", {
  expect_error(
    dk_get_entries(12345, entry_keys = 1, iv = "", jwe = ""),
    "cookies are required"
  )
})

## dk_get_player_fp() timeframe validation ---------------------------------

test_that("dk_get_player_fp() errors on invalid NFL timeframe", {
  expect_error(
    dk_get_player_fp(timeframe = 20230312, sport = "nfl"),
    "timeframe.*sport"
  )
})

test_that("dk_get_player_fp() errors on invalid NBA timeframe", {
  expect_error(
    dk_get_player_fp(timeframe = 5, sport = "nba"),
    "timeframe.*sport"
  )
})

## dk_prepare_schematic() --------------------------------------------------

test_that("dk_prepare_schematic() errors on overlapping include/exclude", {
  expect_error(
    dk_prepare_schematic(
      draft_group_id = 1,
      include_players = c(100, 200),
      exclude_players = c(200, 300)
    ),
    "cannot include the same player"
  )
})

## dk_req_process() output validation --------------------------------------

test_that("dk_req_process() errors on invalid output value", {
  req <- dk_req()
  expect_error(
    dk_req_process(req, output = "invalid"),
    "invalid"
  )
})

## dk_req_process() request output mode ------------------------------------

test_that("dk_req_process() returns request object for output='request'", {
  req <- dk_req(paths = "test/endpoint")
  result <- dk_req_process(req, output = "request")
  expect_s3_class(result, "httr2_request")
})
