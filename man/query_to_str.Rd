% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/query_to_str.R
\name{query_to_str}
\alias{query_to_str}
\title{Convert a \code{query} to a string}
\usage{
query_to_str(query)
}
\arguments{
\item{query}{an IEDB query,
as created by, for example, \link{create_healthy_human_query}.
Use \link{check_query} to check if the \code{query} is valid}
}
\value{
the \code{query} as a string
}
\description{
Convert a \code{query} to a string,
with one line per key-value pair
}
\examples{
query_to_str(create_healthy_human_query())
}
\author{
Richèl J.C. Bilderbeek
}
