library(httptest2)

# to avoid errors with R CMD CHECK
set_redactor(function (x) {
  x <- gsub_response(
    x,
    paste0(
      collapse = "|",
      c(
        "live.draftkings.com/api",
        "api.draftkings.com/sites/US-DK",
        "api.draftkings.com",
        "www.draftkings.com"
      )
    ),
    "url"
  )


  x <- gsub_response(
    x,
    paste0(
      collapse = "|",
      c(
        "v2/leaderboards",
        "scores/v1/leaderboard"
      )
    ),
    "leaderboard"
  )

  x <- gsub_response(
    x,
    "leaderboard/players/seasons",
    "players"
  )

  x <- gsub_response(
    x,
    "draftgroups/v1/draftgroups",
    "draftgroups/v1"
  )

  x <- gsub_response(
    x,
    "draftgroups/v3/draftgroups",
    "draftgroups/v3"
  )

  x <- gsub_response(
    x,
    "v2/entries",
    "entries"
  )

  x <- gsub_response(
    x,
    "contests/v1/contests",
    "contests"
  )

  x <- gsub_response(
    x,
    "lineups/v1/gametypes",
    "lineups"
  )

  x <- gsub_response(
    x,
    "sports/v1",
    "sports"
  )

  x <- gsub_response(
    x,
    "lobby/getcontests",
    "lobby"
  )


})
