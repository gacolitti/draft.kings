#' Get Leaderboard
#'
#' Fetch leaderboard for a contest. A leaderboard
#' contains a list of entries in a contest,
#' fantasy points for each entry, associated user
#' for each entry, rank, and winnings.
#'
#' @inheritParams dk_req_process
#' @inheritParams dk_get_contest_info
#' @inheritDotParams dk_req
#' @param iv Character string. The 'iv' cookie value. If not provided, it will be retrieved from the DK_IV environment variable.
#' @param jwe Character string. The 'jwe' cookie value. If not provided, it will be retrieved from the DK_JWE environment variable.
#'
#' @examples
#'   \dontrun{
#'     dk_get_leaderboard(133645678)
#'   }
#'
#' @export
dk_get_leaderboard <- function(contest_key,
                               iv = Sys.getenv("DK_IV"),
                               jwe = Sys.getenv("DK_JWE"),
                               output = c("cleaned_json", "json", "response", "request"),
                               process_args = NULL,
                               ...) {

  output <- rlang::arg_match(output)

  if (nchar(iv) == 0 || nchar(jwe) == 0) {
    rlang::abort("Both 'iv' and 'jwe' cookies are required. Set DK_IV and DK_JWE environment variables or pass them directly.")
  }

  clean_cook <- paste0("iv=", iv, ";jwe=", jwe)

  # Update curl options to ensure it includes cookies
  dots_list <- list(...)
  if ("curl_options" %in% names(dots_list)) {
    dots_list[["curl_options"]] <- utils::modifyList(dots_list[["curl_options"]], list("cookie" = clean_cook))
  } else {
    dots_list[["curl_options"]] <- list("cookie" = clean_cook)
  }

  req <- do.call(
    dk_req,
    c(
      list(
        paths = glue::glue("scores/v1/leaderboards/{contest_key}"),
        query_params = list(
          "format" = "json",
          "embed" = "leaderboard"
        )
      ),
      dots_list
    )
  )

  process_args <- c(list(req = req, output = output, objclass = "leaderboard_resp"),
                    process_args)

  do.call(dk_req_process, process_args)

}

#' Get Entry Details
#'
#' Fetch details for entries in a contest,
#' including the drafted roster for each
#' entry, stats for each player in an entry roster,
#' and the fantasy points associated to each stat.
#'
#' @inheritParams dk_req_process
#' @inheritParams dk_get_leaderboard
#' @inheritParams dk_get_draft_group
#' @inheritDotParams dk_req
#' @param entry_keys Vector of numeric (or character) keys that correspond to a specific entry in
#'   a specific contest. See output from [dk_get_leaderboard()].
#'
#' @examples
#'   \dontrun{
#'     dk_get_entries(draft_group_id = 80584, entry_keys = c(3618408508, 3618897002))
#'   }
#'
#' @export
dk_get_entries <- function(draft_group_id,
                           entry_keys,
                           iv = Sys.getenv("DK_IV"),
                           jwe = Sys.getenv("DK_JWE"),
                           output = c("cleaned_json", "json", "response", "request"),
                           process_args = NULL,
                           ...) {

  output <- rlang::arg_match(output)

  if (nchar(iv) == 0 || nchar(jwe) == 0) {
    rlang::abort("Both 'iv' and 'jwe' cookies are required. Set DK_IV and DK_JWE environment variables or pass them directly.")
  }

  clean_cook <- paste0("iv=", iv, ";jwe=", jwe)

  # Update curl options to ensure it includes cookies
  dots_list <- list(...)
  if ("curl_options" %in% names(dots_list)) {
    dots_list[["curl_options"]] <- utils::modifyList(dots_list[["curl_options"]], list("cookie" = clean_cook))
  } else {
    dots_list[["curl_options"]] <- list("cookie" = clean_cook)
  }

  req <- do.call(
    dk_req,
    c(
      list(
        paths = glue::glue("scores/v2/entries/{draft_group_id}/{paste0(entry_keys, collapse = ',')}"),
        query_params = list(
          "format" = "json",
          "embed" = "roster"
        )
      ),
      dots_list
    )
  )

  process_args <- c(list(req = req, output = output, objclass = "entries_resp"),
                    process_args)

  do.call(dk_req_process, process_args)

}
