% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sports.R
\name{dk_get_sports}
\alias{dk_get_sports}
\title{Get Sports}
\usage{
dk_get_sports(
  output = c("cleaned_json", "json", "response", "request"),
  process_args = NULL,
  ...
)
}
\arguments{
\item{output}{One of "cleaned_json" (the default),
"json", "response", or "request". If "cleaned_json" then \code{\link[tidyjson:spread_all]{tidyjson::spread_all()}} is used
to parse the JSON body,}

\item{process_args}{Optional list of arguments passed to \code{dk_req_process}}

\item{...}{
  Arguments passed on to \code{\link[=dk_req]{dk_req}}
  \describe{
    \item{\code{query_params}}{A list of query parameters passed to \verb{[httr2::req_url_query]}.}
    \item{\code{proxy_args}}{List of arguments to \link[httr2:req_proxy]{httr2::req_proxy}}
    \item{\code{curl_options}}{List of arguments to \link[httr2:req_options]{httr2::req_options}}
    \item{\code{throttle_rate}}{List of arguments to \link[httr2:req_throttle]{httr2::req_throttle}}
    \item{\code{headers}}{List of arguments to \code{\link[httr2:req_headers]{httr2::req_headers()}}}
    \item{\code{paths}}{List of arguments to \code{\link[httr2:req_url]{httr2::req_url_path_append()}}}
    \item{\code{error_handling_options}}{List of arguments to \code{\link[httr2:req_error]{httr2::req_error()}}}
    \item{\code{retry_options}}{List of arguments passed to \code{\link[httr2:req_retry]{httr2::req_retry()}}}
    \item{\code{base_url}}{Base URL for request.}
    \item{\code{method}}{Custom HTTP method}
  }}
}
\description{
Fetch list of sport names and IDs.
}
\examples{
  \dontrun{
    dk_get_sports()
  }

}
