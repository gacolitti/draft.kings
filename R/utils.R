#' Clean table or vector of names
#'
#' @return Returns vector if vector or data.frame if data.frame.
#' @param .data Data.frame or vector of column names.
#' @param unique Should the variable names be unique?
#' @param minus_to_underscore By default `-` is replaced with `minus`.
#'   This argument replaces the hyphen with `_` (underscore) instead.
#' 
#' @keywords internal
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

  content_type <- httr2::resp_content_type(resp)

  if (content_type == "application/json") {
    paste0(
      tools::toTitleCase(gsub("_", " ", httr2::resp_body_json(resp)$errorType)),
      "\n",
      httr2::resp_body_json(resp)$error
    )
  } else if (content_type == "text/html") {
    httr2::resp_body_html(resp)
  }

}

#' Check the classes of a data frame and allow for multiple different classes for certain columns
#'
#' This function checks the classes of a data frame and allows for certain columns to have multiple
#' allowed classes.
#'
#' @param df The data frame to check
#' @param class_list A named list that specifies the expected classes for each column
#'
#'   The `class_list` argument should be a named list, where the names correspond to the column
#'   names in `df`. Each entry in the list should be a character vector of the allowed classes for
#'   the corresponding column. For example, `class_list = list(col1 = "numeric", col2 =
#'   c("character", "factor"), col3 = "logical")` specifies that `col1` must be of class
#'   `"numeric"`, `col2` must be of class `"character"` or `"factor"`, and `col3` must be of class
#'   `"logical"`.
#'
#' @return The checked data frame
#'
#' @examples
#' \dontrun{
#' df <- data.frame(
#'   col1 = c(1, 2, 3),
#'   col2 = c("a", "b", "c"),
#'   col3 = c(TRUE, FALSE, TRUE),
#'   stringsAsFactors = FALSE
#' )
#'
#' class_list <- list(
#'   col1 = "numeric",
#'   col2 = c("character", "factor"),
#'   col3 = "logical"
#' )
#'
#' check_df(df, class_list)
#' }
#'
#' @keywords internal
check_df <- function(df, class_list) {
  # check that required columns are present in data frame
  required_columns <- names(class_list)
  missing_cols <- setdiff(required_columns, colnames(df))
  if (length(missing_cols) > 0) {
    cli::cli_abort(
        "Missing required columns from `{deparse(substitute(df))}`: {missing_cols}"
    )
  }

  # iterate over required columns and check classes
  for (col in required_columns) {
    allowed_classes <- class_list[[col]]
    if (!class(df[[col]]) %in% allowed_classes) {
      cli::cli_abort(
        "Column `{col}` must be of class {.cls {allowed_classes}}"
      )
    }
  }

  # return the checked data frame
  return(df)
}


#' Check Solver
#'
#' Ensure the solver name passed to `dk_optimize_lineup` is available
#'
#' @param solver A string of the solver name.
#'
#' @keywords internal
check_solver <- function(solver) {

  if (!requireNamespace(glue::glue("ROI.plugin.{solver}"), quietly = TRUE)) {

    cli::cli_abort(
      "The `ROI.plugin.{solver}` package is required to use this function."
    )

  }

}
