#' @title The Wald test and CI for a common ratio of probabilities
#' @description The Wald test and CI for a common ratio of probabilities
#' @description based on either the Mantel-Haenszel or inverse variance estimate
#' @description Described in Chapter 10 "Stratified 2x2 Tables and
#' Meta-Analysis"
#' @param n the observed table (a 2x2xk matrix, where k is the number of strata)
#' @param estimatetype Mantel-Haenszel or inverse variance estimate
#' ('MH' or 'IV')
#' @param alpha the nominal level, e.g. 0.05 for 95% CIs
#' @examples
#' # Smoking and lung cancer (Doll and Hill, 1950)
#' Wald_test_and_CI_common_ratio_stratified_2x2(doll_hill_1950)
#'
#' # Prophylactice use of Lidocaine in myocardial infarction (Hine et al., 1989)
#' Wald_test_and_CI_common_ratio_stratified_2x2(hine_1989)
#' @export
#' @return An object of the [contingencytables_result] class,
#' basically a subclass of [base::list()]. Use the [utils::str()] function
#' to see the specific elements returned.
Wald_test_and_CI_common_ratio_stratified_2x2 <- function(
  n, estimatetype = "MH", alpha = 0.05
) {
  validateArguments(mget(ls()))

  n1pk <- apply(n[1, , ], 2, sum)
  np1k <- apply(n[, 1, ], 2, sum)
  n2pk <- apply(n[2, , ], 2, sum)
  nppk <- apply(n, 3, sum)

  # Get the MH or IV overall estimates (and the weights for the IV)
  if (identical(estimatetype, "MH")) {
    phihat <- MantelHaenszel_estimate_stratified_2x2(n, "log")[[1]]
  } else if (identical(estimatetype, "IV")) {
    tmp <- InverseVariance_estimate_stratified_2x2(n, "log")
    phihat <- tmp[[1]]
    v <- tmp[[3]]
  }

  # Estimate the standard error
  if (identical(estimatetype, "MH")) {
    C <- sum((n1pk * n2pk * np1k - n[1, 1, ] * n[2, 1, ] * nppk) / (nppk^2))
    D <- sum(n[1, 1, ] * n2pk / nppk)
    E <- sum(n[2, 1, ] * n1pk / nppk)
    SElog <- sqrt(C / (D * E))
  } else if (identical(estimatetype, "IV")) {
    SElog <- 1 / sqrt(sum(v))
  }

  # The Wald test statistic
  Z <- log(phihat) / SElog

  # The two-sided P-value (reference distribution: standard normal)
  P <- 2 * (1 - pnorm(abs(Z), 0, 1))

  # The upper alpha / 2 percentile of the standard normal distribution
  z_alpha <- qnorm(1 - alpha / 2, 0, 1)

  # Calculate the confidence limits
  L <- phihat * exp(-z_alpha * SElog)
  U <- phihat * exp(z_alpha * SElog)

  printresults <- function() {
    cat(
      sprintf("The Wald test (%s): P = %7.5f, Z = %6.3f\n", estimatetype, P, Z)
    )
    cat(
      sprintf(
        "The Wald CI (%s): phihat = %6.4f (%g%% CI %6.4f to %6.4f)",
        estimatetype, phihat, 100 * (1 - alpha), L, U
      )
    )
  }

  return(
    contingencytables_result(
      list("Pvalue" = P, "Z" = Z, "lower" = L, "upper" = U, "phihat" = phihat),
      printresults
    )
  )
}
