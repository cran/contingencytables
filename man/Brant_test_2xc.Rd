% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Brant_test_2xc.R
\name{Brant_test_2xc}
\alias{Brant_test_2xc}
\title{The Brant test for the proportional odds assumption}
\usage{
Brant_test_2xc(n)
}
\arguments{
\item{n}{the observed table (a 2xc matrix)}
}
\value{
An object of the \link{contingencytables_result} class,
basically a subclass of \code{\link[base:list]{base::list()}}. Use the \code{\link[utils:str]{utils::str()}} function
to see the specific elements returned.
}
\description{
The Brant test for the proportional odds assumption

Described in Chapter 6 "The Ordered 2xc Table"
}
\examples{
Brant_test_2xc(fontanella_2008)
Brant_test_2xc(lydersen_2012a)
}
