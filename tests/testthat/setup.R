library(httptest2)

# to avoid errors with R CMD CHECK
# want to replace the root of request URL with just mosaic_api
set_redactor(function (x) {
  gsub_response(
    x,
    "live.draftkings.com/api/v2/leaderboards|api.draftkings.com/draftgroups/v1",
    "url"
  )

})
