#' Solve the one-dimensional heat equation using the Crank-Nicolson method
#'
#' @param u0 numeric vector Initial temperature
#' @param L length of the bar
#' @param alpha thermal diffusivity
#' @param dt time step
#' @param t total time
#' @param bc list (left=0, right=0)
#'
#' @return Matrix solution
#' @examples
#' u0 <- rep(20, 21) # Vecteur de temperature initiale
#' U <- solve_heat1d_cn(u0, L=1, alpha=0.1, dt=0.001, t=0.1, bc=list(left=80, right=80))
#' @export
solve_heat1d_cn <- function(u0, L, alpha, dt, t, bc=list(left=0, right=0)){
  nx <- length(u0)
  dx <- L/(nx-1)
  lambda <- alpha * dt / dx^2

  # Note: Crank-Nicolson est stable pour tout lambda > 0,
  # mais on garde votre vérification si vous le souhaitez.
  if(lambda > 0.5){
    warning("lambda > 0.5 : La solution pourrait osciller bien que C-N soit stable.")
  }

  nt <- floor(t/dt)
  U <- matrix(0, nrow=nt+1, ncol=nx)
  U[1,] <- u0

  # Matrice tri-diagonale (Coefficients pour C-N)
  a <- rep(-lambda/2, nx-1)
  b <- rep(1 + lambda, nx)
  c <- rep(-lambda/2, nx-1)

  for (i in 1:nt){
    # Calcul du membre de droite (RHS)
    # Dans CN, le RHS dépend de la solution au temps précédent
    rhs <- U[i, ]

    # Application des conditions aux limites
    rhs[1] <- bc$left
    rhs[nx] <- bc$right

    # Résolution du système pour le temps i+1
    U[i+1, ] <- thomas_solve(a, b, c, rhs)
  }

  return(U)
}
