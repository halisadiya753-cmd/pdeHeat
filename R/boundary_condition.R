#' Create boundary condition functions
#'
#' @param left numeric or function Left boundary ; numeric value or function of time.
#' @param right numeric or function Right boundary ; numeric value or function of time.
#'
#' @returns description A list with two functions; left(t)and right(t).
#'
#' @examples
#' boundary_condition(left=1)
#' @export
boundary_condition <- function(left=0, right=0){
  left_fun <- if(is.function(left)) left else function(t) left
  right_fun <- if(is.function(right)) right else function(t) right
  return(list(left=left_fun, right=right_fun))
}
