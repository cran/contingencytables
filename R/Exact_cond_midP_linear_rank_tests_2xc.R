#' @title Exact conditional and mid-P linear rank tests
#' @description Exact conditional and mid-P linear rank tests
#' @description Described in Chapter 6 "The Ordered 2xc Table"
#' @param n the observed table (a 2xc matrix)
#' @param b scores assigned to the columns (if b=0, midranks will be used as scores)
#' @examples
#' Exact_cond_midP_linear_rank_tests_2xc(lydersen_2012a)
#' \dontrun{Exact_cond_midP_linear_rank_tests_2xc(fontanella_2008)}
#' @export
#' @return An object of the [contingencytables_result] class,
#' basically a subclass of [base::list()]. Use the [utils::str()] function
#' to see the specific elements returned.
Exact_cond_midP_linear_rank_tests_2xc <- function(n, b = 0) {
  validateArguments(mget(ls()))
  c0 <- ncol(n)
  nip <- apply(n, 1, sum)
  npj <- apply(n, 2, sum)
  N <- sum(n)

  if (b == 0) {
    b <- rep(0, c0)
    for (j in 1:c0) {
      a0 <- ifelse(j > 1, sum(npj[1:(j - 1)]), 0)
      b0 <- 1 + sum(npj[1:j])
      b[j] <- 0.5 * (a0 + b0)
    }
  }

  # Calculate all nchoosek beforehand
  npj_choose_x1j <- fill_nchoosek(c0, npj)
  N_choose_n1p <- choose(N, nip[1])

  # The observed value of the test statistic
  Tobs <- linear_rank_test_statistic(n[1, ], b)

  # Calculate the smallest one-sided P-value and the point probability
  # Need separate functions for different values of c (the number of columns)
  if (c0 == 3) {
    tmp <- calc_Pvalue_2x3.ExactCond_linear(Tobs, nip, npj, N_choose_n1p, npj_choose_x1j, b)
    one_sided_P <- tmp$one_sided_P
    point_prob <- tmp$point_prob
  } else if (c0 == 4) {
    tmp <- calc_Pvalue_2x4.ExactCond_linear(Tobs, nip, npj, N_choose_n1p, npj_choose_x1j, b)
    one_sided_P <- tmp$one_sided_P
    point_prob <- tmp$point_prob
  }

  # Two-sided twice-the-smallest tail P-value and mid-P value
  P <- 2 * one_sided_P
  midP <- 2 * (one_sided_P - 0.5 * point_prob)

  # Output
  printresults <- function() {
    cat_sprintf("Exact cond. linear rank test: P = %7.5f\n", P)
    cat_sprintf("Mid-P linear rank test:   mid-P = %7.5f", midP)
  }

  return(contingencytables_result(list("Pvalue" = P, "midP" = midP), printresults))
}
