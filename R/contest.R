
#' Get Contest Info
#'
#' Fetch contest information such as the sport, payout, and contest summary.
#'
#' @inheritParams add_proxy
#' @inheritParams add_curl_options
#' @inheritParams add_throttle
#' @inheritParams add_headers
#' @inheritParams httr2::req_error
#' @param contest_id The sequence of digits that correspond to a specific contest.
#'   This can be found by examining the URL of a contest page.
#'   For example: \url{https://www.draftkings.com/draft/contest/133645678#}. Here the contest ID
#'   is 133645678.
#'
#' @examples
#'   \dontrun{
#'     get_contest_info(133645678)
#'   }
#'
#' @export
get_contest_info <- function(contest_id,
                             throttle_rate = NULL,
                             proxy_args = NULL,
                             headers = NULL,
                             retry_options = NULL,
                             is_error_func = NULL,
                             curl_options = NULL,
                             output = c("cleaned_json", "json", "response", "request")) {

  stopifnot(is.numeric(contest_id))
  output <- match.arg(output)

  req <- dkreq(
    req,
    proxy_args = proxy_args,
    throttle_rate = throttle_rate,
    headers = headers,
    curl_options = curl_options,
    retry_options = retry_options,
    is_error_func = is_error_func
  )

  req <- httr2::req_url_path_append(
    req,
    glue::glue(
      "contests/v1/contests/{contest_id}?format=json"
    )
  )

  dkreq_process(req, output)

}

#' Get List of Contests
#'
#' Fetch the full table of contests and related info
#'
#' @export
get_contests <- function(sport = NULL) {

  res <-   httr2::request(base_url = "https://www.draftkings.com/lobby/getcontests") %>%
    httr2::req_url_query(sport = sport) %>%
    httr2::req_perform() %>%
    httr2::resp_body_json()

  res$Contests %>%
    tidyjson::spread_all() %>%
    dplyr::as_tibble() %>%
    dplyr::select(-document.id) %>%
    clean_names()

}

#' Get Gametype Rules
#'
#' Fetch rules corresponding to a specific game type ID.
#'
#' @param game_type_id Integer corresponding to the game type.
#'   For example, 159 in \url{https://api.draftkings.com/lineups/v1/gametypes/159/rules}.
#'   If both `game_type_id` and `contest_id` are passed, then `contest_id` is ignored.
#'
#' @export
get_gametype_rules <- function(game_type_id = NULL,
                               contest_id = NULL) {

  if (all(is.null(game_type_id), is.null(contest_id))) {

    cli::cli_abort(
      "`game_type_id` and `contest_id` cannot both be missing"
    )

  }

  if (is.null(game_type_id)) {

    game_type_id <- get_contest_info(contest_id)$game_type_id

  }

  httr2::request(
    glue::glue("https://api.draftkings.com/lineups/v1/gametypes/{game_type_id}/rules")
  ) %>%
    httr2::req_perform() %>%
    httr2::resp_body_string() %>%
    tidyjson::spread_all() %>%
    dplyr::as_tibble() %>%
    dplyr::select(-document.id) %>%
    clean_names()

}

