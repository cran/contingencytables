% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gamma_coefficient_rxc_bca.R
\name{gamma_coefficient_rxc_bca}
\alias{gamma_coefficient_rxc_bca}
\title{The gamma coefficient with the bias-corrected and accelerated boostrap confidence interval}
\usage{
gamma_coefficient_rxc_bca(n, nboot = 10000, alpha = 0.05, printresults = TRUE)
}
\arguments{
\item{n}{the observed table (an rxc matrix)}

\item{nboot}{number of bootstrap samples}

\item{alpha}{the nominal significance level, used to compute a 100(1-alpha) confidence interval}

\item{printresults}{display results (FALSE = no, TRUE = yes)}
}
\value{
a list with the gamma coefficient and the confidence interval limits
}
\description{
The gamma coefficient with the bias-corrected and accelerated boostrap confidence interval

Described in Chapter 7 "The rxc Table"
}
\examples{
\dontrun{
# Colorectal cancer (Table 7.7)
n <- rbind(
  c(2, 4, 29, 19), c(7, 6, 116, 51), c(19, 27, 201, 76), c(18, 22, 133, 54)
)
gamma_coefficient_rxc_bca(n)

# Breast Tumor (Table 7.8)
n <- matrix(
  c(15, 35, 6, 9, 6, 2, 4, 2, 11, 11, 0, 0, 1, 10, 21),
  ncol = 5, byrow = TRUE
)
gamma_coefficient_rxc_bca(n)

# Self-rated health (Table 7.9)
n <- matrix(
  c(2, 3, 3, 3, 2, 58, 98, 14, 8, 162, 949, 252, 4, 48, 373, 369),
  ncol = 4, byrow = TRUE
)
gamma_coefficient_rxc_bca(n)
}
}
