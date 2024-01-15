#' Format a given number of seconds into a human-readable time format
#'
#' @param seconds A numeric value representing the number of seconds to format
#' @param digits An integer value indicating the number of digits after the decimal point
#'   to round to (default is 1)
#'
#' @return A character string representing the formatted time
#'
#' @keywords internal
format_time <- function(seconds, digits = 1) {
  if (seconds < 60) {
    return(paste(round(seconds, digits), "seconds"))
  } else if (seconds < 3600) {
    minutes <- seconds / 60
    return(paste(round(minutes, digits), "minutes"))
  } else if (seconds < 86400) {
    hours <- seconds / 3600
    return(paste(round(hours, digits), "hours"))
  } else if (seconds < 604800) {
    days <- seconds / 86400
    return(paste(round(days, digits), "days"))
  } else {
    weeks <- seconds / 604800
    return(paste(round(weeks, digits), "weeks"))
  }
}

#' Format a time duration into a human-readable time format
#'
#' @param start_time A POSIXct value representing the start time of the duration
#' @param end_time A POSIXct value representing the end time of the duration (default is
#'   NULL, which sets the end time to the current system time)
#'
#' @return A character string representing the formatted duration
#'
#' @keywords internal
format_duration <- function(start_time, end_time = NULL) {

  if (is.null(end_time)) end_time <- Sys.time()
  elapsed_time <- as.numeric(difftime(end_time, start_time, units = "secs"))
  format_time(elapsed_time)

}

#' Format duration between two times in seconds, minutes, hours, or days
#'
#' This function takes the start and end time as inputs and outputs a pretty
#' formatted duration in seconds, minutes, hours, or days.
#'
#' @param start_time The start time as a POSIXct object.
#' @param end_time The end time as a POSIXct object.
#' @param prefix Optional text to include before the duration.
#'
#' @return A character string representing the duration between the start and end
#' time, formatted as an integer followed by the appropriate time unit (e.g.
#' "1 day", "30 minutes", "5 seconds").
#'
#' @examples
#'
#' \dontrun{
#' start_time <- as.POSIXct("2023-03-17 12:00:00", tz = "UTC")
#' end_time <- as.POSIXct("2023-03-18 12:30:45", tz = "UTC")
#' pretty_duration(start_time, end_time)
#' }
#'
#' @keywords internal
pretty_duration <- function(start_time, end_time = Sys.time(), prefix = NULL) {
  # Calculate the duration in seconds
  duration <- difftime(end_time, start_time, units = "secs")
  if (duration < 10) return()

  # Define time units and their conversion factors
  time_units <- c("day", "hour", "minute", "second")
  conversion_factors <- c(86400, 3600, 60, 1)

  # Find the largest time unit that fits into the duration
  unit_idx <- min(which(duration / conversion_factors >= 1))

  # Calculate the duration in the selected time unit
  duration_in_units <- as.integer(duration / conversion_factors[unit_idx])

  # Pluralize the time unit using the cli package
  pluralized_output <- cli::pluralize(
    paste0(
      if (!is.null(prefix)) paste0(prefix, ": "),
      "{duration_in_units} ",
      time_units[unit_idx], "{?s}")
  )

  # Output the formatted duration string to the console using the cli package
  cli::cli_alert_success(pluralized_output)

  # Return the formatted duration string
  invisible(pluralized_output)
}
