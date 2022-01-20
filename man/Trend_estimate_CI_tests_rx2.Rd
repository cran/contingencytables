% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Trend_estimate_CI_tests_rx2.R
\name{Trend_estimate_CI_tests_rx2}
\alias{Trend_estimate_CI_tests_rx2}
\title{Trend estimate for linear and logit models}
\usage{
Trend_estimate_CI_tests_rx2(
  n,
  a,
  linkfunction = "logit",
  alpha = 0.05,
  printresults = TRUE
)
}
\arguments{
\item{n}{the observed counts (an rx2 matrix)}

\item{a}{scores assigned to the rows}

\item{linkfunction}{Link function for the binomial distribution see
\code{?family} for more details}

\item{alpha}{the nominal level, e.g. 0.05 for 95\% CIs}

\item{printresults}{display results (0 = no, 1 = yes)}
}
\value{
A list containing several test statistics (see description above).
}
\description{
Trend estimate for linear and logit models
\itemize{
\item The Wald test and CI
\item Likelihood ratio test
\item The Pearson goodness-of-fit test
\item Likelihood ratio (deviance) goodness-of-fit test
}

Described in Chapter 5 "The Ordered rx2 Table"
}
\examples{
# Alcohol consumption and malformations (Mills and Graubard, 1987)
n <- matrix(
 c(48, 17066, 38, 14464, 5, 788, 1, 126, 1, 37),
 ncol = 2,
 byrow = TRUE
)
n <- rbind(c(48,17066),c(38,14464),c(5,788),c(1,126),c(1,37)) #same as before
a <- c(1, 2, 3, 4, 5)
Trend_estimate_CI_tests_rx2(n, a)

# levated troponin T levels in stroke patients (Indredavik et al., 2008)
n <- rbind(c(8,53),c(10,48),c(11,100),c(22,102),c(6,129))
a <- c(1, 2, 3, 4, 5)
Trend_estimate_CI_tests_rx2(n, a)
}