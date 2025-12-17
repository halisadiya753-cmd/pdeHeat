#' Create initial temperature profile
#'
#' @param x numeric Spatial grid vector
#' @param type character Type:"constant","spike","gaussian".
#' @param value numeric Peak or constant value (default 1)
#' @param position numeric Position in 0,1 fot spike/gaussian(relative).
#' @param sigma numeric Standard deviation for gaussian (relatuve units).
#'
#' @returns Numeric vector of same length as x (initial temperature).
#'
#' @examples
#' initial_condition(c(1,55,8))
#' @export
initial_condition <- function(x, type="spike", value=1, position=0.5, sigma=0.05){
  if(!is.numeric(x)||length(x)<3) stop("x must be numeric vector length >= 3")
  nx <- length(x)
  if(type=="constant"){
    return(rep(value, nx))
  }else if (type=="spike"){
    u0 <- rep(0, nx)
    idx <- which.min(abs(x - (min(x)+position*(max(x)-min(x)))))
    u0[idx] <- value
    return(u0)
  }else if (type=="gaussian"){
    mu <- min(x)+position*(max(x)-min(x))
    u0 <- value*exp(-(x-mu)^2/(2*(sigma*(max(x)-min(x)))^2))
    return(u0)
  } else{
    stop("Unknown type: choose'constant','spike', or 'gaussion'")
  }
}
