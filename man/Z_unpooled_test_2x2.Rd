% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Z_unpooled_test_2x2.R
\name{Z_unpooled_test_2x2}
\alias{Z_unpooled_test_2x2}
\title{The Z-unpooled test for association in 2x2 tables}
\usage{
Z_unpooled_test_2x2(n)
}
\arguments{
\item{n}{the observed counts (a 2x2 matrix)}
}
\value{
An object of the \link{contingencytables_result} class,
basically a subclass of \code{\link[base:list]{base::list()}}. Use the \code{\link[utils:str]{utils::str()}} function
to see the specific elements returned.
}
\description{
The Z-unpooled test for association in 2x2 tables

Described in Chapter 4 "The 2x2 Table"
}
\examples{
# Example: A lady tasting a cup of tea
Z_unpooled_test_2x2(tea)

# Example: Perondi et al. (2004)
Z_unpooled_test_2x2(perondi_2004)

# Example: Lampasona et al. (2013)
Z_unpooled_test_2x2(lampasona_2013)

# Example: Ritland et al. (2007)
Z_unpooled_test_2x2(ritland_2007)

}
