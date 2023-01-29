
httptest2::with_mock_dir("sports", {

  test_that("dk_get_sports() returns expected results", {

    d <- dk_get_sports()

    expect_equal(d$sport_id[1], 1)

  })

})
