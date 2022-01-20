#' @title The Wald test and confidence interval for the difference between marginal mean scores
#' @description The Wald test and confidence interval for the difference between marginal mean scores
#' @description Described in Chapter 9 "The Paired cxc Table"
#' @param n the observed table (a cxc matrix)
#' @param a scores assigned to the outcome categories
#' @param alpha the nominal level, e.g. 0.05 for 95% CIs
#' @param printresults display results (FALSE = no, TRUE = yes)
#' @examples
#' # A comparison between serial and retrospective measurements
#' # (Fischer et al., 1999)
#' n <- rbind(
#'   c(1, 0, 1, 0, 0),
#'   c(0, 2, 8, 4, 4),
#'   c(1, 1, 31, 14, 11),
#'   c(1, 0, 15, 9, 12),
#'   c(0, 0, 2, 1, 3)
#' )
#' a <- c(8, 3.5, 0, -3.5, -8)
#' Wald_test_and_CI_marginal_mean_scores_paired_cxc(n, a)
#' @export
#' @return A list containing the Wald test and the Wald CI statistics
Wald_test_and_CI_marginal_mean_scores_paired_cxc <- function(n, a, alpha = 0.05, printresults = TRUE) {
  c <- nrow(n)
  N <- sum(n)
  nip <- apply(n, 1, sum)
  npi <- apply(n, 2, sum)
  Y1mean <- sum(a * (nip / N))
  Y2mean <- sum(a * (npi / N))
  pihat <- n / N

  scoressum <- 0
  for (i in 1:c) {
    for (j in 1:c) {
      scoressum <- scoressum + ((a[i] - a[j])^2) * pihat[i, j]
    }
  }

  # Estimate of the difference between marginal mean scores (deltahat)
  estimate <- Y1mean - Y2mean

  # Standard error of the estimate
  SE <- sqrt((scoressum - estimate^2) / N)

  # The Wald test statistic
  Z_Wald <- estimate / SE

  # The upper alpha/2 percentile of the standard normal distribution
  z <- qnorm(1 - alpha / 2, 0, 1)

  # Calculate the confidence limits
  L <- estimate - z * SE
  U <- estimate + z * SE

  # The two-sided P-value (reference distribution: standard normal)
  P <- 2 * (1 - pnorm(abs(Z_Wald), 0, 1))

  if (printresults) {
    .print("The Wald test: P = %7.5f, Z = %6.3f\n", P, Z_Wald)
    .print("The Wald CI: estimate = %6.4f (%g%% CI %6.4f to %6.4f)\n", estimate, 100 * (1 - alpha), L, U)
  }

  invisible(list(P = P, Z_Wald = Z_Wald, L = L, U = U, estimate = estimate))
}

.print <- function(s, ...) {
  print(sprintf(gsub("\n", "", s), ...), quote = F)
}