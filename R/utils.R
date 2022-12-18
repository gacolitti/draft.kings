#' Clean table or vector of names
#'
#' @return Returns vector if vector or data.frame if data.frame.
#' @param .data Data.frame or vector of column names.
#' @param unique Should the variable names be unique?
#' @param minus_to_underscore By default `-` is replaced with `minus`.
#'   This argument replaces the hyphen with `_` (underscore) instead.
#'
#' @export
clean_names <- function(.data,
                        unique = FALSE,
                        minus_to_underscore = FALSE) {

  n <- if (is.data.frame(.data)) colnames(.data) else .data

  # If Non-ASCII characters found, return original strings
  if (any(grepl("[^ -~]", n))) {
    warning("Found non-ASCII characters. Returning original names...", call. = FALSE)
    return(n)
  }

  n <- gsub("%+", "_per_", n)
  n <- gsub("\\$+", "_dollars_", n)
  n <- gsub("\\++", "_plus_", n)

  if (minus_to_underscore) {
    n <- gsub("-+", "_", n)
  } else {
    n <- gsub("-+", "_minus_", n)
  }

  n <- gsub("\\*+", "_star_", n)
  n <- gsub("#+", "_cnt_", n)
  n <- gsub("&+", "_and_", n)
  n <- gsub("@+", "_at_", n)


  n <- gsub("[^a-zA-Z0-9_]+", "_", n)
  n <- gsub("([A-Z][a-z])", "_\\1", n)
  n <- tolower(trimws(n))
  n <- gsub("(^_+|_+$)", "", n)
  n <- gsub("_+", "_", n)

  if (unique) n <- make.unique(n, sep = "_")

  if (is.data.frame(.data)) {
    colnames(.data) <- n
    .data
  } else {
    n
  }
}

#' Returns the error message from a response
#'
#' @param resp Output from [httr2::req_perform()]
#'
#' @noRd
#' @keywords internal
get_error_body <- function(resp) {

  if (httr2::resp_content_type(resp) == "application/json") {

    resp_body <- httr2::resp_body_json(resp)
    paste0(
      tools::toTitleCase(gsub("_", " ", (resp_body$errorType))),
      "\n",
      resp_body$error
    )

  } else if (httr2::resp_content_type(resp) == "text/html") {

    httr2::resp_body_html(resp)

  }

}

#' Process Request Based on Output Argument
#'
#' @inheritParams add_retry
#'
#' @param output One of "cleaned_json" (the default),
#'   "json", "response", or "request". If "cleaned_json" then [tidyjson::spread_all()] is used
#'   to parse the JSON body,
#' @param subset Subset JSON list if `output = "cleaned_json"`
dkreq_process <- function(req, output, subset = NULL) {

  if (output == "request") {

    return(req)

  } else {

    resp <- httr2::req_perform(req)

  }


  if (output == "response") {

    return(resp)

  } else {

    resp_json <-  httr2::resp_body_json(resp)

  }

  if (output == "json") {

    return(resp_json)

  } else {

    if (!is.null(subset)) {

      resp_json <- resp_json[[subset]]

    }

    resp_json_clean <- resp_json %>%
      purrr::compact() %>%
      tidyjson::spread_all() %>%
      dplyr::as_tibble() %>%
      dplyr::select(-document.id) %>%
      clean_names()

    return(resp_json_clean)

  }

}

