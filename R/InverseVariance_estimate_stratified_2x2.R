#' @title The inverse variance estimate of the overall effect across strata
#' @description The inverse variance estimate of the overall effect across strata
#' @description Described in Chapter 10 "Stratified 2x2 Tables and Meta-Analysis"
#' @param n the observed table (a 2x2xk matrix, where k is the number of strata)
#' @param link the link function ('linear', 'log', or 'logit')
#' @param printresults display results (FALSE = no, TRUE = yes)
#' @examples
#' # Smoking and lung cancer (Doll and Hill, 1950)
#' n <- array(dim = c(2, 2, 2))
#' n[, , 1] <- matrix(c(647, 622, 2, 27), 2, byrow = TRUE)
#' n[, , 2] <- matrix(c(41, 28, 19, 32), 2, byrow = TRUE)
#' InverseVariance_estimate_stratified_2x2(n)
#'
#' # Prophylactice use of Lidocaine in myocardial infarction (Hine et al., 1989)
#' n <- array(0, dim = c(2, 2, 6))
#' n[, , 1] <- rbind(c(2, 37), c(1, 42))
#' n[, , 2] <- rbind(c(4, 40), c(4, 40))
#' n[, , 3] <- rbind(c(6, 101), c(4, 106))
#' n[, , 4] <- rbind(c(7, 96), c(5, 95))
#' n[, , 5] <- rbind(c(7, 103), c(3, 103))
#' n[, , 6] <- rbind(c(11, 143), c(4, 142))
#' InverseVariance_estimate_stratified_2x2(n)
#'
#' @export
#' @return a list respectively containing the inverse variance estimate of the overall effect (\code{estimate}), the stratum-specific effect estimates (\code{psihat}) and the weights (\code{v}).
InverseVariance_estimate_stratified_2x2 <- function(n, link = "logit", printresults = TRUE) {
  n1pk <- apply(n[1, , ], 2, sum)
  n2pk <- apply(n[2, , ], 2, sum)

  # Calculate stratum-specific effect estimates
  if (identical(link, "linear")) {
    psihat <- n[1, 1, ] / n1pk - n[2, 1, ] / n2pk
  } else if (identical(link, "log")) {
    psihat <- log((n[1, 1, ] / n1pk) / (n[2, 1, ] / n2pk))
  } else if (identical(link, "logit")) {
    psihat <- log((n[1, 1, ] * n[2, 2, ]) / (n[1, 2, ] * n[2, 1, ]))
  }

  # Calculate weights
  if (identical(link, "linear")) {
    v <- 1 / (n[1, 1, ] * n[1, 2, ] / n1pk^3 + n[2, 1, ] * n[2, 2, ] / n2pk^3)
  } else if (identical(link, "log")) {
    v <- 1 / (1 / n[1, 1, ] - 1 / n1pk + 1 / n[2, 1, ] - 1 / n2pk)
  } else if (identical(link, "logit")) {
    v <- 1 / (1 / n[1, 1, ] + 1 / n[1, 2, ] + 1 / n[2, 1, ] + 1 / n[2, 2, ])
  }

  # The inverse variance estimate of the overall effect
  estimate <- sum(v * psihat) / sum(v)
  if (identical(link, "log") || identical(link, "logit")) {
    estimate <- exp(estimate)
  }

  if (printresults) {
    .print("The inverse variance estimate = %7.4f\n", estimate)
  }

  invisible(list(estimate = estimate, psihat = psihat, v = v))
}

.print <- function(s, ...) {
  print(sprintf(gsub("\n", "", s), ...), quote = FALSE)
}