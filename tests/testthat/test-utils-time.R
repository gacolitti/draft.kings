## format_time() -----------------------------------------------------------

test_that("format_time() returns seconds for < 60", {
  expect_equal(format_time(30), "30 seconds")
  expect_equal(format_time(0), "0 seconds")
  expect_equal(format_time(59.9), "59.9 seconds")
})

test_that("format_time() returns minutes for 60..3599", {
  expect_equal(format_time(60), "1 minutes")
  expect_equal(format_time(120), "2 minutes")
  expect_equal(format_time(3599), "60 minutes")
})

test_that("format_time() returns hours for 3600..86399", {
  expect_equal(format_time(3600), "1 hours")
  expect_equal(format_time(7200), "2 hours")
})

test_that("format_time() returns days for 86400..604799", {
  expect_equal(format_time(86400), "1 days")
  expect_equal(format_time(172800), "2 days")
})

test_that("format_time() returns weeks for >= 604800", {
  expect_equal(format_time(604800), "1 weeks")
  expect_equal(format_time(1209600), "2 weeks")
})

test_that("format_time() respects digits parameter", {
  expect_equal(format_time(90, digits = 2), "1.5 minutes")
  expect_equal(format_time(90, digits = 0), "2 minutes")
})

## format_duration() -------------------------------------------------------

test_that("format_duration() computes elapsed time between two times", {
  start <- as.POSIXct("2023-01-01 00:00:00", tz = "UTC")
  end   <- as.POSIXct("2023-01-01 00:01:30", tz = "UTC")
  expect_equal(format_duration(start, end), "1.5 minutes")
})

test_that("format_duration() uses current time when end_time is NULL", {
  start <- Sys.time() - 30
  result <- format_duration(start)
  expect_match(result, "seconds")
})

## pretty_duration() -------------------------------------------------------

test_that("pretty_duration() returns NULL for duration < 10 seconds", {
  start <- Sys.time() - 5
  expect_null(pretty_duration(start))
})

test_that("pretty_duration() returns formatted string for duration >= 10", {
  start <- as.POSIXct("2023-01-01 00:00:00", tz = "UTC")
  end   <- as.POSIXct("2023-01-01 00:01:00", tz = "UTC")
  result <- pretty_duration(start, end)
  expect_match(result, "minute")
})

test_that("pretty_duration() includes prefix when provided", {
  start <- as.POSIXct("2023-01-01 00:00:00", tz = "UTC")
  end   <- as.POSIXct("2023-01-01 01:00:00", tz = "UTC")
  result <- pretty_duration(start, end, prefix = "Elapsed")
  expect_match(result, "Elapsed")
})

test_that("pretty_duration() pluralizes correctly", {
  start <- as.POSIXct("2023-01-01 00:00:00", tz = "UTC")
  end   <- as.POSIXct("2023-01-01 02:00:00", tz = "UTC")
  result <- pretty_duration(start, end)
  expect_match(result, "hours")
})

test_that("pretty_duration() uses singular for 1 unit", {
  start <- as.POSIXct("2023-01-01 00:00:00", tz = "UTC")
  end   <- as.POSIXct("2023-01-01 01:00:00", tz = "UTC")
  result <- pretty_duration(start, end)
  expect_match(result, "1 hour$")
})
