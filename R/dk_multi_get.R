
#' Perform multiple HTTP requests with a delay
#'
#' @description
#' `multi_req_perform_with_sleep` performs multiple HTTP requests concurrently
#' and introduces a delay (sleep) after the requests have been sent.
#'
#' @inheritParams httr2::multi_req_perform
#'
#' @param sleep A numeric value indicating the number of seconds to sleep
#' after performing the requests. If NULL or negative, no sleep is performed.
#' @param ... Other arguments passed to [httr2::multi_req_perform()]
#'
#' @details
#' This function is a wrapper around `httr2::multi_req_perform` that allows for
#' the introduction of a delay after sending out a batch of requests. This can be
#' useful for rate limiting or when dealing with APIs that have request quotas
#' over time.
#'
#' @return A list of responses from `httr2::multi_req_perform`.
#'
#' @examples
#' \dontrun{
#' req_list <- list(
#'   httr2::request("http://httpbin.org/get"),
#'   httr2::request("http://httpbin.org/get")
#' )
#' responses <- multi_req_perform_with_sleep(req_list, sleep = 2)
#' }
#'
#' @keywords internal
#'
multi_req_perform_with_sleep <- function(reqs, sleep = 3, paths = NULL, ...) {
  if (!is.numeric(sleep) || sleep < 0) {
    stop("`sleep` should be a non-negative numeric value.")
  }

  out <- httr2::multi_req_perform(reqs, ...)

  if (!is.null(sleep) && sleep > 0) {
    Sys.sleep(sleep)
  }

  out
}

#' Chunk a vector into a specified number of chunks or a specified chunk size
#'
#' @param x A vector or other R object that can be split.
#' @param n_chunks An optional integer indicating the desired number of chunks.
#' @param chunk_size An optional integer indicating the desired number of elements per chunk.
#'
#' @details
#' This function splits the input `x` into multiple chunks based on the specified
#' `n_chunks` or `chunk_size`. If both are provided, `chunk_size` takes precedence
#' and `n_chunks` is ignored with a warning. If neither is provided, the function
#' will stop with an error. The function returns a list of chunks.
#'
#' @return A list of chunks.
#'
#' @examples
#' \dontrun{
#' vec <- 1:10
#' chunk(vec, chunk_size = 3)
#' chunk(vec, n_chunks = 3)
#' }
#'
#' @keywords internal
#'
chunk <- function(x, n_chunks = NULL, chunk_size = NULL) {

  if (is.null(n_chunks) && is.null(chunk_size)) {
    stop("Both `n_chunks` and `chunk_size` cannot be NULL.")
  }

  if (!is.null(n_chunks) && !is.null(chunk_size)) {
    warning("Both `n_chunks` and `chunk_size` were specified. Only `chunk_size` will be used.")
    n_chunks <- NULL
  }

  if (!is.null(chunk_size)) {
    if (chunk_size <= 0) {
      stop("`chunk_size` must be a positive integer.")
    }
    groups <- ceiling(seq_along(x) / chunk_size)
    out <- split(x, groups)
  } else {
    if (n_chunks <= 0) {
      stop("`n_chunks` must be a positive integer.")
    }
    groups <- cut(seq_along(x), n_chunks, labels = FALSE)
    out <- split(x, groups)
  }

  out
}


#' Get Draft Kings Data in Parallel
#'
#' Fetch DraftKings data in parallel using `httr2::multi_req_perform()`
#' and in batches.
#'
#' @inheritParams dk_request_process
#' @inheritParams chunk
#' @inheritParams multi_req_perform_with_sleep
#' @inheritParams purrr::map
#'
#' @param report_time Should the time it took the function to complete be reported?
#'
#' @export
dk_multi_get <- function(reqs,
                         paths = NULL,
                         chunk_size = Inf,
                         n_chunks = NULL,
                         sleep = 3,
                         report_time = TRUE,
                         .progress = TRUE,
                         ...) {

  start_time <- Sys.time()

  request_batches <- chunk(reqs,
                           n_chunks = n_chunks,
                           chunk_size = chunk_size)

  if (!is.null(paths)) {
    path_batches <- chunk(paths,
                          n_chunks = n_chunks,
                          chunk_size = chunk_size)
  }


  responses_lst <- purrr::map2(
    .progress = .progress,
    request_batches,
    path_batches,
    \(reqs, paths) multi_req_perform_with_sleep(reqs, sleep = sleep, paths = paths, ...)
  )

  out <- do.call("c", responses_lst)

  if (report_time) pretty_duration(start_time, prefix = "Total time")

  out

}
