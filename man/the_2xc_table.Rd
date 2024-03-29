% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/the_2xc_table.R
\name{the_2xc_table}
\alias{the_2xc_table}
\title{The 2xc table}
\usage{
the_2xc_table(n, alpha = 0.05, direction = "increasing")
}
\arguments{
\item{n}{the total number of observations}

\item{alpha}{the nominal level, e.g. 0.05 for 95\% CIs}

\item{direction}{the direction of the success probabilities}
}
\value{
A string of "-". This function should be called for its printed output.
}
\description{
The 2xc table
}
\examples{
\dontrun{
# The Adolescent Placement Study (Fontanella et al., 2008)
n <- rbind(c(8, 28, 72, 126), c(46, 73, 69, 86))
the_2xc_table(n)

# Postoperative nausea (Lydersen et al., 2012a)
n <- rbind(c(14, 10, 3, 2), c(11, 7, 8, 4))
dir <- "decreasing"
the_2xc_table(n, direction = dir)
}
}
