## Tests for httr2 wrapper functions ----------------------------------------
## Each wrapper should return the request unchanged when passed NULL,
## and modify the request when passed non-NULL args.

test_that("add_proxy() returns request unchanged when proxy_args is NULL", {
  req <- httr2::request("https://example.com")
  result <- add_proxy(req, NULL)
  expect_identical(result, req)
})

test_that("add_curl_options() returns request unchanged when NULL", {
  req <- httr2::request("https://example.com")
  result <- add_curl_options(req, NULL)
  expect_identical(result, req)
})

test_that("add_curl_options() modifies request when non-NULL", {
  req <- httr2::request("https://example.com")
  result <- add_curl_options(req, list(timeout = 30))
  expect_false(identical(result, req))
  expect_s3_class(result, "httr2_request")
})

test_that("add_throttle() returns request unchanged when NULL", {
  req <- httr2::request("https://example.com")
  result <- add_throttle(req, NULL)
  expect_identical(result, req)
})

test_that("add_throttle() modifies request when non-NULL", {
  req <- httr2::request("https://example.com")
  result <- add_throttle(req, list(rate = 1))
  expect_false(identical(result, req))
  expect_s3_class(result, "httr2_request")
})

test_that("add_headers() returns request unchanged when NULL", {
  req <- httr2::request("https://example.com")
  result <- add_headers(req, NULL)
  expect_identical(result, req)
})

test_that("add_headers() adds headers when non-NULL", {
  req <- httr2::request("https://example.com")
  result <- add_headers(req, list("X-Custom" = "test"))
  expect_equal(result$headers[["X-Custom"]], "test")
})

test_that("add_retry() returns request unchanged when NULL", {
  req <- httr2::request("https://example.com")
  result <- add_retry(req, NULL)
  expect_identical(result, req)
})

test_that("add_retry() modifies request when non-NULL", {
  req <- httr2::request("https://example.com")
  result <- add_retry(req, list(max_tries = 3))
  expect_false(identical(result, req))
  expect_s3_class(result, "httr2_request")
})

test_that("add_error_handling() uses default get_error_body when NULL", {
  req <- httr2::request("https://example.com")
  result <- add_error_handling(req)
  expect_s3_class(result, "httr2_request")
})

test_that("add_error_handling() uses custom options when provided", {
  req <- httr2::request("https://example.com")
  result <- add_error_handling(req, error_handling_options = list(is_error = function(resp) FALSE))
  expect_s3_class(result, "httr2_request")
})

test_that("add_to_path() returns request unchanged when NULL", {
  req <- httr2::request("https://example.com")
  result <- add_to_path(req, NULL)
  expect_identical(result, req)
})

test_that("add_to_path() appends path segments", {
  req <- httr2::request("https://example.com")
  result <- add_to_path(req, list("api", "v1", "endpoint"))
  expect_match(result$url, "api/v1/endpoint")
})
