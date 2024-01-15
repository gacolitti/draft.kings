
# Tests for chunk() ----
# Test for correct chunking with chunk_size
test_that("chunk splits correctly with chunk_size", {
  vec <- 1:10
  result <- chunk(vec, chunk_size = 3)
  expect_equal(length(result), 4)
  expect_equal(result[[1]], 1:3)
  expect_equal(result[[4]], 10)
})

# Test for correct chunking with n_chunks
test_that("chunk splits correctly with n_chunks", {
  vec <- 1:10
  result <- chunk(vec, n_chunks = 3)
  expect_equal(length(result), 3)
})

# Test for warning when chunk_size is greater than length of x
test_that("warning when chunk_size is greater than length of x", {
  vec <- 1:5
  expect_warning(chunk(vec, chunk_size = 10))
})

# Test for warning when n_chunks is greater than length of x
test_that("warning when n_chunks is greater than length of x", {
  vec <- 1:5
  expect_warning(chunk(vec, n_chunks = 10))
})

# Test for error when both n_chunks and chunk_size are NULL
test_that("error when both n_chunks and chunk_size are NULL", {
  vec <- 1:10
  expect_error(chunk(vec))
})

# Test for error when chunk_size is not a positive integer
test_that("error when chunk_size is not a positive integer", {
  vec <- 1:10
  expect_error(chunk(vec, chunk_size = -1))
})

# Test for error when n_chunks is not a positive integer
test_that("error when n_chunks is not a positive integer", {
  vec <- 1:10
  expect_error(chunk(vec, n_chunks = -1))
})

# Tests for dk_multi_get() ----

httptest2::with_mock_dir("dk_multi_get", {
  # Test for successful request
  test_that("successful request returns correct response", {
    reqs <- list(
      httr2::request("https://httpbin.org/get")
    )
    reqs <- rep(reqs, 5)
    result <- dk_multi_get(reqs)
    expect_equal(length(result), 5)
    expect_true(all(sapply(result, \(x) x$status == 200)))
  })

  # Test for handling of batch_sleep and retry_sleep
  test_that("batch_sleep and retry_sleep are handled correctly", {
    reqs <- list(
      httr2::request("https://httpbin.org/status/403"),
      httr2::request("https://httpbin.org/status/403")
    )
    batch_sleep <- 2
    retry_sleep <- 1
    n_chunks <- 2
    max_tries <- 2
    start_time <- Sys.time()
    # Suppress warnings because retries will fail both times
    result <- suppressWarnings(
      dk_multi_get(reqs, batch_sleep = batch_sleep, retry_sleep = retry_sleep,
                   n_chunks = n_chunks, max_tries = max_tries,
                   .progress = FALSE)
    )
    end_time <- Sys.time()

    # Expect 5s delay for sleep between batches and
    # 4s delay for retrying each batch twice (1s delay per try set by retry_sleep)
    expected_time <- batch_sleep + retry_sleep * n_chunks * max_tries
    time_diff <- as.numeric(difftime(end_time, start_time, units = "secs"))

    # Added tolerance to account for the time it actually takes to perform requests
    # which should be minimal
    expect_equal(time_diff, expected_time, tolerance = 1)
    expect_equal(length(result), 2)
  })
})


# Test for handling of invalid retry_sleep
test_that("invalid retry_sleep value throws an error", {
  reqs <- list(httr2::request("https://httpbin.org/get"))
  expect_error(dk_multi_get(reqs, retry_sleep = -1))
})

# Test for handling invalid batch_sleep
test_that("invalid batch_sleep value throws an error", {
  reqs <- list(httr2::request("https://httpbin.org/get"))
  expect_error(dk_multi_get(reqs, batch_sleep = -1))
})

# Test for handling mismatched lengths of reqs and paths
test_that("mismatched lengths of reqs and paths throws an error", {
  reqs <- list(httr2::request("https://httpbin.org/get"), httr2::request("https://httpbin.org/get"))
  paths <- list("path1")
  expect_error(dk_multi_get(reqs, paths = paths))
})
