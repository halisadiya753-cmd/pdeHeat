#' Solve Heat Equation(Explicit method)
#'
#' @param u0 initial temperature vector
#' @param L length of the bar
#' @param alpha thermal diffusivity
#' @param dt time step
#' @param t final time
#' @param bc list (boundary_left=0, boundary_right=0)
#'
#' @returns matrix of solution
#'
#' @examples
#' u0 <- sin(seq(0, pi, length.out=20))
#' U <- solve_heat1d_explicit(u0, L=1, alpha=0.1, dt=0.001, t=0.1)
#' @export
solve_heat1d_explicit <- function( u0, L, alpha, dt, t, bc=list(left=0, right=0)){
  nx <- length(u0)
  dx <- L/(nx-1)
  lambda <- alpha * dt /dx^2
  if(lambda>0.5){
    stop("condition de stabilite non respectee: lambda <= 0.5 obligatoire")
  }
  nt <- floor(t/dt)
  U <- matrix(0, nrow=nt+1, ncol=nx)
  U[1,] <- u0
  for(n in 1:nt){
    for(i in 2:(nx-1)){
      U[n+1,i] <- U[n,i]+lambda*(U[n,i+1]-2*U[n,i]+U[n,i-1])
    }
    U[n+1,1] <- bc$left
    U[n+1,nx] <- bc$right
  }
  return(U)
}
