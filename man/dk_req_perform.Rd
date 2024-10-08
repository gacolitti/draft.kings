% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/perform.R
\name{dk_req_perform}
\alias{dk_req_perform}
\title{Perform Draft Kings API Request}
\usage{
dk_req_perform(
  req,
  path = NULL,
  verbosity = NULL,
  mock = getOption("httr2_mock", NULL),
  output = c("json", "response"),
  objclass = NULL
)
}
\arguments{
\item{req}{A \link[httr2]{request}.}

\item{path}{Optionally, path to save body of the response. This is useful
for large responses since it avoids storing the response in memory.}

\item{verbosity}{How much information to print? This is a wrapper
around \code{\link[httr2:req_verbose]{req_verbose()}} that uses an integer to control verbosity:
\itemize{
\item \code{0}: no output
\item \code{1}: show headers
\item \code{2}: show headers and bodies
\item \code{3}: show headers, bodies, and curl status messages.
}

Use \code{\link[httr2:with_verbosity]{with_verbosity()}} to control the verbosity of requests that
you can't affect directly.}

\item{mock}{A mocking function. If supplied, this function is called
with the request. It should return either \code{NULL} (if it doesn't want to
handle the request) or a \link[httr2]{response} (if it does). See \code{\link[httr2:with_mock]{with_mock()}}/
\code{local_mock()} for more details.}

\item{output}{One of 'json' or 'response'.}

\item{objclass}{character. Name of class to assign to output object. Default
is NULL, and no additional class is assigned. Used to facilitate parsing;
See \code{\link[=dk_resp_parse]{dk_resp_parse()}}.}
}
\description{
Wrapper around \code{\link[httr2:req_perform]{httr2::req_perform()}} that
sends API request and fetches response body.
Also, adds relevant object class for use with
parsing functions; See \code{\link[=dk_resp_parse]{dk_resp_parse()}}.
}
