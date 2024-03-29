#' @title The Wald confidence interval for the difference between probabilities
#' @description The Wald confidence interval for the difference between
#' probabilities with Yates's continuity correction. Described in Chapter 4
#' "The 2x2 Table"
#' @param n the observed counts (a 2x2 matrix)
#' @param alpha the nominal level, e.g. 0.05 for 95% CIs
#' @examples
#' # An RCT of high vs standard dose of epinephrine (Perondi et al., 2004)
#' Wald_CI_CC_2x2(perondi_2004)
#'
#' # The association between CHRNA4 genotype and XFS (Ritland et al., 2007)
#' Wald_CI_CC_2x2(ritland_2007)
#'
#' @export
#' @return An object of the [contingencytables_result] class,
#' basically a subclass of [base::list()]. Use the [utils::str()] function
#' to see the specific elements returned.
Wald_CI_CC_2x2 <- function(n, alpha = 0.05) {
  validateArguments(mget(ls()))

  n1p <- n[1, 1] + n[1, 2]
  n2p <- n[2, 1] + n[2, 2]

  # Estimates of the two probabilities of success
  pi1hat <- n[1, 1] / n1p
  pi2hat <- n[2, 1] / n2p

  # Estimate of the difference between probabilities (deltahat)
  estimate <- pi1hat - pi2hat

  # Standard error of the estimate
  SE <- sqrt(pi1hat * (1 - pi1hat) / n1p + pi2hat * (1 - pi2hat) / n2p)

  # The continuity correction term
  CC <- 0.5 * (1 / n1p + 1 / n2p)

  # The upper alpha / 2 percentile of the standard normal distribution
  z <- qnorm(1 - alpha / 2, 0, 1)

  # Calculate the confidence limits
  L <- estimate - z * SE - CC
  U <- estimate + z * SE + CC

  # Fix overshoot by truncation
  L <- max(-1, L)
  U <- min(U, 1)

  printresults <- function() {
    sprintf(
      paste(
        "The Wald CI with continuity correction: estimate =",
        "%6.4f (%g%% CI %6.4f to %6.4f)"
      ),
      estimate, 100 * (1 - alpha), L, U
    )
  }

  res <- list("lower" = L, "upper" = U, "estimate" = estimate)
  return(contingencytables_result(res, printresults))
}
