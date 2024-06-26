% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dk_get.R
\name{dk_get}
\alias{dk_get}
\title{Get Draft Kings Data}
\usage{
dk_get(
  func,
  keys,
  output = c("all", "cleaned_json", "json", "response", "request"),
  retry_options = NULL,
  proxy_args = NULL,
  report_time = TRUE,
  .progress = TRUE,
  furrr_options = NULL,
  ...
)
}
\arguments{
\item{func}{A function from the \code{draft.kings} package.}

\item{keys}{This is passed as the first argument to \code{func}.}

\item{output}{One of "cleaned_json" (the default),
"json", "response", or "request". If "cleaned_json" then \code{\link[tidyjson:spread_all]{tidyjson::spread_all()}} is used
to parse the JSON body,}

\item{retry_options}{List of arguments passed to \code{httr2::req_retry()}.
If \code{NULL} (the default), \code{max_tries} is set to 5 and these status codes are considered
transient: 429, 500, 503, 408, 400.}

\item{proxy_args}{List of arguments to \code{httr2::req_proxy}.
If \code{NULL} (the default), this argument will look for environmental variables
related to PacketStream. See details section for which environmental variables should
be set.}

\item{report_time}{Should the time it took the function to complete be reported?}

\item{.progress}{A single logical. Should a progress bar be displayed?
Only works with multisession, multicore, and multiprocess futures. Note
that if a multicore/multisession future falls back to sequential, then
a progress bar will not be displayed.

\strong{Warning:} The \code{.progress} argument will be deprecated and removed
in a future version of furrr in favor of using the more robust
\href{https://CRAN.R-project.org/package=progressr}{progressr}
package.}

\item{furrr_options}{Options passed to \code{furrr::furrr_options}.
If \code{NULL} (the default), then will use \code{seed} and \code{stdout} to \code{TRUE}, and ensure
required packages are passed to the workers.}

\item{...}{Other arguments passed to underlying \code{draft.kings} function (\code{func})}
}
\description{
Fetch DraftKings data
in parallel using Packet Stream proxies by default.
}
\details{
If \code{proxy_args} is \code{TRUE}, then the following environmental variables should be set:

PACKET_STREAM_URL
PACKET_STREAM_PORT
PACKET_STREAM_USER
PACKET_STREAM_PASS
}
