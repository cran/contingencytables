% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/the_paired_cxc_table_nominal.R
\name{the_paired_cxc_table_nominal}
\alias{the_paired_cxc_table_nominal}
\title{The Paired CxC table - nominal}
\usage{
the_paired_cxc_table_nominal(n, alpha = 0.05)
}
\arguments{
\item{n}{the total number of observations}

\item{alpha}{the nominal level, e.g. 0.05 for 95\% CIs}
}
\value{
A string containing the last line of the printed text. This function should be called for its printed output.
}
\description{
The Paired CxC table - nominal
}
\examples{
# Pretherapy susceptability of pathogens (Peterson et al., 2007)
n <- rbind(c(596, 18, 6, 5), c(0, 2, 0, 0), c(0, 0, 42, 0), c(11, 0, 0, 0))
the_paired_cxc_table_nominal(n)
}
