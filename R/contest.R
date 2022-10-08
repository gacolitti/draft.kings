
#' Get Contest Info
#'
#' Fetch contest information such as the sport, payout, and contest summary.
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
get_contest_info <- function(contest_id) {

  stopifnot(is.numeric(contest_id))

  httr2::request("https://api.draftkings.com/contests/v1/contests/133682546?format=json") %>%
    httr2::req_perform() %>%
    httr2::resp_body_json() %>%
    tidyjson::spread_all() %>%
    dplyr::as_tibble() %>%
    dplyr::select(-document.id) %>%
    tidyr::drop_na() %>%
    clean_names()

}

#' Get List of Contests
#'
#' Fetch the full table of contests and related info
#'
#' @export
get_contests <- function() {

  res <-   httr2::request(base_url = "https://www.draftkings.com/lobby/getcontests") %>%
    httr2::req_perform() %>%
    httr2::resp_body_json()

  res$Contests %>%
    tidyjson::spread_all() %>%
    dplyr::as_tibble() %>%
    dplyr::select(-document.id) %>%
    clean_names()

}
