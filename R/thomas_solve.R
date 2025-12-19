#' Algorithme de Thomas pour systeme tri-diagonal
#'
#' @param a sous-diagonale
#' @param b diagonale principale
#' @param c sur-diagonale
#' @param d vecteur membre de droite
#' @export
thomas_solve <- function(a, b, c, d) {
  n <- length(b)
  cp <- rep(0, n - 1)
  dp <- rep(0, n)

  # Phase d'élimination
  cp[1] <- c[1] / b[1]
  dp[1] <- d[1] / b[1]

  # On n'entre dans la boucle que si n > 2
  if (n > 2) {
    for (i in 2:(n - 1)) {
      denom <- b[i] - a[i - 1] * cp[i - 1]
      cp[i] <- c[i] / denom
      dp[i] <- (d[i] - a[i - 1] * dp[i - 1]) / denom
    }
  }

  # Dernier élément (Correction de la division)
  denom_n <- b[n] - a[n - 1] * cp[n - 1]
  dp[n] <- (d[n] - a[n - 1] * dp[n - 1]) / denom_n

  # Substitution arrière
  x <- rep(0, n)
  x[n] <- dp[n]
  for (i in (n - 1):1) {
    x[i] <- dp[i] - cp[i] * x[i + 1]
  }

  return(x)
}
