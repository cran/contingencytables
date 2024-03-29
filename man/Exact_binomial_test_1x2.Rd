% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Exact_binomial_test_1x2.R
\name{Exact_binomial_test_1x2}
\alias{Exact_binomial_test_1x2}
\title{The exact binomial test for the binomial probability (pi)}
\usage{
Exact_binomial_test_1x2(X, n, pi0)
}
\arguments{
\item{X}{the number of successes}

\item{n}{the total number of observations}

\item{pi0}{a given probability}
}
\value{
An object of the \link{contingencytables_result} class,
basically a subclass of \code{\link[base:list]{base::list()}}. Use the \code{\link[utils:str]{utils::str()}} function
to see the specific elements returned.
}
\description{
H_0 pi = pi0  vs  H_A: pi ~= pi0 (two-sided)

Described in Chapter 2 "The 1x2 Table and the Binomial Distribution"
}
\examples{
Exact_binomial_test_1x2(singh_2010["1st", "X"], singh_2010["1st", "n"], pi0 = 0.513)
Exact_binomial_test_1x2(singh_2010["2nd", "X"], singh_2010["2nd", "n"], pi0 = 0.513)
Exact_binomial_test_1x2(singh_2010["3rd", "X"], singh_2010["3rd", "n"], pi0 = 0.513)
Exact_binomial_test_1x2(singh_2010["4th", "X"], singh_2010["4th", "n"], pi0 = 0.513)
Exact_binomial_test_1x2(ligarden_2010["X"], ligarden_2010["n"], pi0 = 0.5)
}
