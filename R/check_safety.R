#' Check Pasteurization Safety
#'
#' Analyzes the temperature at the center of the food item to determine if
#' safety thresholds were met during the process.
#'
#' @param U matrix Numerical solution matrix from solve_heat1d_cn.
#' @param dt numeric Time step used in the simulation.
#' @param threshold numeric Critical temperature target (default is 72°C).
#' @param required_time numeric Minimum time required at the center (in seconds).
#'
#' @return A list containing:
#'   \item{safe}{logical; TRUE if the safety criteria are met.}
#'   \item{duration_above}{numeric; total time the center stayed above the threshold.}
#' @export
check_safety <- function(U, dt, threshold = 72, required_time = 15) {
  nx <- ncol(U)
  center_idx <- ceiling(nx / 2)
  center_temp <- U[, center_idx]

  time_above <- sum(center_temp >= threshold) * dt
  is_safe <- time_above >= required_time

  if(is_safe) {
    message("Success: Item is pasteurized (", round(time_above, 2), "s at center).")
  } else {
    warning("Failure: Insufficient time above threshold (", round(time_above, 2), "s / ", required_time, "s).")
  }

  return(list(safe = is_safe, duration_above = time_above))
  }
