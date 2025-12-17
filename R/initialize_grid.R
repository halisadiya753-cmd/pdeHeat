#' Initialize spatial and temporal grid
#'
#' @param L numeric Length of the spatial domain.
#' @param nx integer Number of spatial grid points.
#' @param t Total simulation time.
#' @param nt integer Number of time steps.
#'
#' @returns A list with elements: x (space vector)
#' @examples
#' grid <- initialize_grid()
#' @export
initialize_grid <- function(L=1, nx=101, t=1, nt=NULL){
  if(!is.numeric(L) || L<=0) stop("L must be positive numeric")
  if(!is.numeric(nx) || nx<3) stop("nx must be integer >=3")
  if(!is.numeric(L) || t<=0) stop("t must be positive numeric")

  if(is.null(nt)){
   # choose nt so dt similar scale to dx^2(safe default)
    dx_default <- L/(nx-1)
    dt_default <- dx_default^2
    nt <- max(1, ceiling(t/dt_default))
  } else {
    if (!is.numeric(nt)|| nt<1) stop("nt must")
  }
  dx <- L/(nx-1)
  dt <- t/nt
  x <- seq(0, L, length.out=nx)
  c <- seq(0, t, length.out=nt+1)

  return(list(x=x, c=c, dx=dx, dt=dt, nx=nx))

}
