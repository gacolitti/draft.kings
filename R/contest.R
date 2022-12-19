
#' Get Contest Info
#'
#' Fetch contest information such as the sport, payout, and contest summary.
#'
#' @inheritParams dkreq
#' @inheritParams dkreq_process
#' @inheritParams add_throttle
#' @inheritParams add_proxy
#' @inheritParams add_headers
#' @inheritParams add_retry
#' @inheritParams add_error_handling
#' @inheritParams add_curl_options
#'
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
                             error_handling_options = NULL,
                             curl_options = NULL,
                             output = c("cleaned_json", "json", "response", "request")) {

  stopifnot(is.numeric(contest_id))
  output <- match.arg(output)

  req <- dkreq(
    proxy_args = proxy_args,
    throttle_rate = throttle_rate,
    headers = headers,
    curl_options = curl_options,
    retry_options = retry_options,
    error_handling_options = error_handling_options,
    paths = glue::glue("contests/v1/contests/{contest_id}"),
    query_params = list(format = "json")
  )

  dkreq_process(req, output)

}

#' Get List of Contests
#'
#' Fetch the full table of contests and related info from DraftKings.com lobby
#'
#' @inheritParams dkreq
#' @inheritParams dkreq_process
#' @inheritParams add_throttle
#' @inheritParams add_proxy
#' @inheritParams add_headers
#' @inheritParams add_retry
#' @inheritParams add_error_handling
#' @inheritParams add_curl_options
#'
#' @param sport character. optional.
#'
#' @export
get_contests <- function(sport = NULL,
                         throttle_rate = NULL,
                         proxy_args = NULL,
                         headers = NULL,
                         retry_options = NULL,
                         error_handling_options = NULL,
                         curl_options = NULL,
                         output = c("cleaned_json", "json", "response", "request")) {

  output <- match.arg(output)

  req <- dkreq(
    base_url = "https://www.draftkings.com/",
    throttle_rate = throttle_rate,
    headers = headers,
    curl_options = curl_options,
    retry_options = retry_options,
    error_handling_options = error_handling_options,
    paths = "lobby/getcontests",
    query_params = list(sport = sport)
  )

  dkreq_process(req, output, subset = "Contests")

}

#' Get Gametype Rules
#'
#' Fetch rules corresponding to a specific game type ID.
#'
#' @inheritParams dkreq
#' @inheritParams dkreq_process
#' @inheritParams get_contest_info
#'
#' @param game_type_id Integer corresponding to the game type.
#'   For example, 159 in \url{https://api.draftkings.com/lineups/v1/gametypes/159/rules}.
#'   If both `game_type_id` and `contest_id` are passed, then `contest_id` is ignored.
#' @param ... Arguments passed to [dkreq()]
#'
#' @export
get_gametype_rules <- function(game_type_id = NULL,
                               contest_id = NULL,
                               output = c("cleaned_json", "json", "response", "request"),
                               ...) {

  output <- match.arg(output)

  if (all(is.null(game_type_id), is.null(contest_id))) {

    cli::cli_abort(
      "`game_type_id` and `contest_id` cannot both be missing"
    )

  }

  if (is.null(game_type_id)) {

    game_type_id <- get_contest_info(contest_id)$game_type_id

  }

  req <- dkreq(..., paths = glue::glue("lineups/v1/gametypes/{game_type_id}/rules"))

  out <- dkreq_process(req, output = "json")

  salary <- out$salaryCap %>%
    purrr::compact() %>%
    dplyr::as_tibble() %>%
    clean_names() %>%
    stats::setNames(paste0("salary_cap_", names(.)))

  team_count <- out$teamCount %>%
    purrr::compact() %>%
    dplyr::as_tibble() %>%
    clean_names() %>%
    stats::setNames(paste0("team_count_", names(.)))

  unique_players <- dplyr::tibble("unique_players" = out$uniquePlayers)

  dplyr::bind_cols(salary, team_count, unique_players)

}

