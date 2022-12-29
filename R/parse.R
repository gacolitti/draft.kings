

#' Extract JSON from Response
#'
#' @noRd
#' @keywords internal
extract_json <- function(resp) {

  if (inherits(resp, "httr2_response")) {

    resp <- httr2::resp_body_json(resp)

  }

  resp

}

#' Parse Response JSON
#'
#' @inheritParams httr2::resp_body_json
#'
#' @export
dk_resp_parse <- function(resp) {
  UseMethod("dk_resp_parse")
}

#' @export
dk_resp_parse.default <- function(resp) {

  extract_json(resp)

}

#' @method dk_resp_parse contest_info_resp
#' @export
dk_resp_parse.contest_info_resp <- function(resp) {

  resp %>%
    extract_json() %>%
    purrr::compact() %>%
    tidyjson::spread_all() %>%
    dplyr::as_tibble() %>%
    dplyr::select(-"document.id") %>%
    clean_names()

}

#' @method dk_resp_parse contests_resp
#' @export
dk_resp_parse.contests_resp <- function(resp) {

  resp <- extract_json(resp)

  resp$Contests %>%
    purrr::compact() %>%
    tidyjson::spread_all() %>%
    dplyr::as_tibble() %>%
    dplyr::select(-"document.id") %>%
    clean_names()

}

#' @method dk_resp_parse gametype_rules_resp
#' @export
dk_resp_parse.gametype_rules_resp <- function(resp) {

  resp <- extract_json(resp)

  scalar_indices <- resp %>%
    tidyjson::json_lengths() %>%
    dplyr::filter(length == 1 | length == 0) %>%
    dplyr::pull("document.id")

  scalar_names <- names(resp[scalar_indices])

  d1 <- purrr::map2_dfc(
    scalar_indices,
    scalar_names,
    function(x, y) {

      val <- resp[[x]]
      val <- ifelse(is.null(val), NA, val)
      df <- data.frame(val)
      stats::setNames(df, y)

    }
  )

  d2 <- purrr::map_dfc(
    c("salaryCap", "gameCount", "teamCount"),
    function(x) {

      vals <- purrr::map(resp[[x]], function(val) ifelse(is.null(val), NA, val))
      tbl <- dplyr::as_tibble(vals)
      stats::setNames(tbl, paste0(x, "_", names(tbl)))

    }
  )

  dplyr::bind_cols(d1, d2) %>%
    dplyr::as_tibble() %>%
    clean_names()

}
