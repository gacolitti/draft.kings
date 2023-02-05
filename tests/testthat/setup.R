library(httptest2)

# to avoid errors with R CMD CHECK
set_redactor(function (x) {
  gsub_response(
    x,
    paste0(
      collapse = "|",
      c(
        "live.draftkings.com/api/v2/leaderboards",
        "api.draftkings.com/draftgroups/v1",
        "api.draftkings.com",
        "api.draftkings.com/scores/v2/entries",
        "api.draftkings.com/scores/v1/leaderboard",
        "api.draftkings.com/contests/v1/contests",
        "api.draftkings.com/lineups/v1/gametypes",
        "api.draftkings.com/sites/US-DK/sports/v1",
        "www.draftkings.com/lobby/getcontests"
      )
    ),
    "url"
  )

})
