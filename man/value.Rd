% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/value.R
\name{value}
\alias{value}
\alias{invalue}
\title{Create a format akin to a SAS format}
\usage{
value(...)

invalue(...)
}
\arguments{
\item{...}{See `vignette("getting_started", package = "SASformatR")`}
}
\value{
A function
}
\description{
Create a format akin to a SAS format
}
\examples{
proc_format(
AGEGR1 = value(
  "< 21" = "<21",
  "21 - 39" = "21 - 39",
  "40 <=" = ">=40"
)
)
}
