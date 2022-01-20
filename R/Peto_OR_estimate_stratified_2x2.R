#' @title The Peto estimate of the common odds ratio across strata
#' @description The Peto estimate of the common odds ratio across strata
#' @description Described in Chapter 10 "Stratified 2x2 Tables and Meta-Analysis"
#' @param n the observed table (a 2x2xk matrix, where k is the number of strata)
#' @param printresults display results (FALSE = no, TRUE = yes)
#' @examples
#' # Smoking and lung cancer (Doll and Hill, 1950)
#' n <- array(dim = c(2, 2, 2))
#' n[, , 1] <- matrix(c(647, 622, 2, 27), 2, byrow = TRUE)
#' n[, , 2] <- matrix(c(41, 28, 19, 32), 2, byrow = TRUE)
#' Peto_OR_estimate_stratified_2x2(n)
#'
#' # Prophylactice use of Lidocaine in myocardial infarction (Hine et al., 1989)
#' n <- array(0, dim = c(2, 2, 6))
#' n[, , 1] <- rbind(c(2, 37), c(1, 42))
#' n[, , 2] <- rbind(c(4, 40), c(4, 40))
#' n[, , 3] <- rbind(c(6, 101), c(4, 106))
#' n[, , 4] <- rbind(c(7, 96), c(5, 95))
#' n[, , 5] <- rbind(c(7, 103), c(3, 103))
#' n[, , 6] <- rbind(c(11, 143), c(4, 142))
#' Peto_OR_estimate_stratified_2x2(n)
#'
#' @export
#' @return A list containing the Peto odds ratio estimate, its conditional expectation (from the hypergeometric distribution) and the variance
Peto_OR_estimate_stratified_2x2 <- function(n, printresults = TRUE) {
  n1pk <- apply(n[1, , ], 2, sum)
  np1k <- apply(n[, 1, ], 2, sum)
  n2pk <- apply(n[2, , ], 2, sum)
  np2k <- apply(n[, 2, ], 2, sum)
  nppk <- apply(n, 3, sum)

  # The conditional expectation (from the hypergeomtric distribution)
  expectation <- n1pk * np1k / nppk

  # The variance (from the hypergeomtric distribution)
  variance <- n1pk * n2pk * np1k * np2k / ((nppk^2) * (nppk - 1))

  # The Peto odds ratio estimate
  estimate <- exp(sum(n[1, 1, ] - expectation) / sum(variance))

  if (printresults) {
    .print("The Peto OR estimate = %7.4f\n", estimate)
  }

  invisible(list(estimate = estimate, expectation = expectation, variance = variance))
}

.print <- function(s, ...) {
  print(sprintf(gsub("\n", "", s), ...), quote = FALSE)
}