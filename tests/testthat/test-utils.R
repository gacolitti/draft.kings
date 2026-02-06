## clean_names() -----------------------------------------------------------

test_that("clean_names() converts CamelCase to snake_case", {
  expect_equal(clean_names("gameTypeId"), "game_type_id")
  expect_equal(clean_names("DraftGroupId"), "draft_group_id")
  expect_equal(clean_names("startTime"), "start_time")
})

test_that("clean_names() replaces special characters", {
  expect_equal(clean_names("win%"), "win_per")
  expect_equal(clean_names("price$"), "price_dollars")
  expect_equal(clean_names("score+"), "score_plus")
  expect_equal(clean_names("a*b"), "a_star_b")
  expect_equal(clean_names("count#"), "count_cnt")
  expect_equal(clean_names("a&b"), "a_and_b")
  expect_equal(clean_names("user@name"), "user_at_name")
})

test_that("clean_names() handles minus with minus_to_underscore flag", {
  expect_match(clean_names("a-b"), "minus")
  expect_equal(clean_names("a-b", minus_to_underscore = TRUE), "a_b")
})

test_that("clean_names() warns and returns original on non-ASCII", {
  expect_warning(
    result <- clean_names("caf\u00e9"),
    "non-ASCII"
  )
  expect_equal(result, "caf\u00e9")
})

test_that("clean_names() with unique = TRUE deduplicates", {
  result <- clean_names(c("a", "a", "b"), unique = TRUE)
  expect_equal(length(unique(result)), 3)
})

test_that("clean_names() works on data.frame", {
  df <- data.frame(GameType = 1, DraftId = 2)
  result <- clean_names(df)
  expect_true(is.data.frame(result))
  expect_true("game_type" %in% colnames(result))
  expect_true("draft_id" %in% colnames(result))
})

test_that("clean_names() works on character vector", {
  result <- clean_names(c("GameType", "DraftId"))
  expect_true(is.character(result))
  expect_equal(length(result), 2)
})

## check_df() --------------------------------------------------------------

test_that("check_df() returns data frame when valid", {
  df <- data.frame(col1 = 1, col2 = "a", stringsAsFactors = FALSE)
  result <- check_df(df, list(col1 = "numeric", col2 = "character"))
  expect_identical(result, df)
})

test_that("check_df() errors on missing columns", {
  df <- data.frame(col1 = 1)
  expect_error(
    check_df(df, list(col1 = "numeric", col2 = "character")),
    "Missing required columns"
  )
})

test_that("check_df() errors on wrong class", {
  df <- data.frame(col1 = "a", stringsAsFactors = FALSE)
  expect_error(
    check_df(df, list(col1 = "numeric")),
    "must be of class"
  )
})

test_that("check_df() accepts multiple allowed classes", {
  df <- data.frame(col1 = 1L)
  result <- check_df(df, list(col1 = c("integer", "numeric")))
  expect_identical(result, df)
})

## check_solver() ----------------------------------------------------------

test_that("check_solver() errors for unavailable solver", {
  expect_error(
    check_solver("nonexistent_solver_xyz"),
    "ROI.plugin.nonexistent_solver_xyz"
  )
})

test_that("check_solver() succeeds for installed solver", {
  skip_if_not_installed("ROI.plugin.glpk")
  expect_silent(check_solver("glpk"))
})
