% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Score_test_for_effect_in_the_probit_model_2xc.R
\name{Score_test_for_effect_in_the_probit_model_2xc}
\alias{Score_test_for_effect_in_the_probit_model_2xc}
\title{Score test for effect in the cumulative probit model}
\usage{
Score_test_for_effect_in_the_probit_model_2xc(n, alphahat0)
}
\arguments{
\item{n}{the observed counts (a 2xc matrix)}

\item{alphahat0}{a column vector with c-1 estimated coefficients
(\code{alpha_j}) under the null hypothesis (\code{beta = 0})}
}
\value{
An object of the \link{contingencytables_result} class,
basically a subclass of \code{\link[base:list]{base::list()}}. Use the \code{\link[utils:str]{utils::str()}} function
to see the specific elements returned.
}
\description{
The score test for effect in the cumulative probit model
described in Chapter 6 "The Ordered 2xc Table"
}
\note{
Must give the alphahats under the null hypothesis as input,
because Matlab does not calculate an intercept-only probit model (and this
may apply to R code as well). alphahat0 can be calculated in, for instance,
Stata.
}
\examples{
# The Adolescent Placement Study (Fontanella et al., 2008)
alphahat0 <- c(-1.246452, -0.5097363, 0.2087471)
Score_test_for_effect_in_the_probit_model_2xc(fontanella_2008, alphahat0)

# Postoperative nausea (Lydersen et al., 2012a)
alphahat0 <- c(-0.1923633, 0.5588396, 1.271953)
Score_test_for_effect_in_the_probit_model_2xc(lydersen_2012a, alphahat0)

}
