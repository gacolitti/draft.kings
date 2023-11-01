library(httptest2)

redact_token_fields <- function(json_body) {
  token_fields <- c(
    "access_token",
    "id_token",
    "refresh_token"
  )
  json_body_fields <- names(json_body)

  for (token_field_name in token_fields) {
    if (token_field_name %in% json_body_fields) {
      json_body[[token_field_name]] <- "REDACTED_TOKEN"
    }
  }

  json_body
}


redact_tokens <- function(response) {
  if (inherits(response, "httr2_response")) {
    json_body <- httr2::resp_body_json(response)
    json_body_with_redacted_fields <- redact_token_fields(json_body)
    response$body <- jsonlite::toJSON(
      json_body_with_redacted_fields,
      auto_unbox = TRUE
    ) |>
      charToRaw()
  }

  response
}

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
  ) |>
    redact_tokens()

})
