% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/the_paired_2x2_table_tests.R
\name{the_paired_2x2_table_tests}
\alias{the_paired_2x2_table_tests}
\title{The Paired 2x2 table tests}
\usage{
the_paired_2x2_table_tests(n, gamma = 1e-04)
}
\arguments{
\item{n}{frequency matrix}

\item{gamma}{parameter for the Berger and Boos procedure}
}
\value{
The value of gamma. This function should be called for its printed output.
}
\description{
The Paired 2x2 table tests
}
\examples{
# Airway hyper-responsiveness before and after stem cell transplantation
# (Bentur et al., 2009)
n <- rbind(c(1, 1), c(7, 12))
the_paired_2x2_table_tests(n)

\dontrun{
# Complete response before and after consolidation therapy
# (Cavo et al., 2012)
n <- rbind(c(59, 6), c(16, 80))
the_paired_2x2_table_tests(n)

#' # Floppy eyelid syndrome vs obstructive sleep apnea (Ezra et al., 2010)
n <- rbind(c(7, 25), c(2, 68))
the_paired_2x2_table_tests(n)
}
}
