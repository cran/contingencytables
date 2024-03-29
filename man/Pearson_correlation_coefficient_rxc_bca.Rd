% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Pearson_correlation_coefficient_rxc_bca.R
\name{Pearson_correlation_coefficient_rxc_bca}
\alias{Pearson_correlation_coefficient_rxc_bca}
\title{The Pearson correlation coefficient with the bias-corrected and accelerated}
\usage{
Pearson_correlation_coefficient_rxc_bca(
  n,
  nboot = 10000,
  a = seq_len(nrow(n)),
  b = seq_len(ncol(n)),
  alpha = 0.05
)
}
\arguments{
\item{n}{the observed table (an rxc matrix)}

\item{nboot}{number of bootstrap samples}

\item{a}{scores assigned to the rows}

\item{b}{scores assigned to the columns}

\item{alpha}{the nominal significance level, used to compute a 100(1-alpha) confidence interval}
}
\value{
An object of the \link{contingencytables_result} class,
basically a subclass of \code{\link[base:list]{base::list()}}. Use the \code{\link[utils:str]{utils::str()}} function
to see the specific elements returned.
}
\description{
The Pearson correlation coefficient with the bias-corrected and accelerated

boostrap confidence interval

Described in Chapter 7 "The rxc Table"
}
\examples{
set.seed(3509)
Pearson_correlation_coefficient_rxc_bca(table_7.7, nboot = 800)
Pearson_correlation_coefficient_rxc_bca(table_7.8, nboot = 200)
\dontrun{
  Pearson_correlation_coefficient_rxc_bca(table_7.9)
}
}
