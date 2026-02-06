## dk_req() ----------------------------------------------------------------

test_that("dk_req() returns an httr2 request object", {
  req <- dk_req()
  expect_s3_class(req, "httr2_request")
})

test_that("dk_req() uses default base URL", {
  req <- dk_req()
  expect_match(req$url, "api.draftkings.com")
})

test_that("dk_req() uses custom base URL", {
  req <- dk_req(base_url = "https://custom.example.com/")
  expect_match(req$url, "custom.example.com")
})

test_that("dk_req() appends paths", {
  req <- dk_req(paths = "api/v1/test")
  expect_match(req$url, "api/v1/test")
})

test_that("dk_req() sets method", {
  req <- dk_req(method = "POST")
  expect_equal(req$method, "POST")
})

test_that("dk_req() adds query params", {
  req <- dk_req(query_params = list(format = "json", sport = "nfl"))
  expect_match(req$url, "format=json")
  expect_match(req$url, "sport=nfl")
})

test_that("dk_req() adds headers", {
  req <- dk_req(headers = list("X-Custom" = "value"))
  expect_equal(req$headers[["X-Custom"]], "value")
})

## dk_req_process() --------------------------------------------------------

test_that("dk_req_process() returns request for output='request'", {
  req <- dk_req(paths = "test")
  result <- dk_req_process(req, output = "request")
  expect_s3_class(result, "httr2_request")
  expect_identical(result, req)
})

test_that("dk_req_process() with output='request' sets objclass on request unchanged", {
  req <- dk_req(paths = "test")
  result <- dk_req_process(req, output = "request", objclass = "my_class")
  # request output returns early, objclass should not be applied
  expect_false("my_class" %in% class(result))
})

## dk_req_process() integration with mocked HTTP ---------------------------

httptest2::with_mock_dir("sports", {

  test_that("dk_req_process() json output returns list with dk_resp_json class", {
    req <- dk_req(
      paths = "sites/US-DK/sports/v1/sports",
      query_params = list(format = "json")
    )
    result <- dk_req_process(req, output = "json", objclass = "sports_resp")
    expect_true("dk_resp_json" %in% class(result))
    expect_true("sports_resp" %in% class(result))
    expect_type(result, "list")
  })

  test_that("dk_req_process() response output returns httr2_response with dk_resp class", {
    req <- dk_req(
      paths = "sites/US-DK/sports/v1/sports",
      query_params = list(format = "json")
    )
    result <- dk_req_process(req, output = "response", objclass = "sports_resp")
    expect_true("dk_resp" %in% class(result))
    expect_true("sports_resp" %in% class(result))
    expect_s3_class(result, "httr2_response")
  })

})
