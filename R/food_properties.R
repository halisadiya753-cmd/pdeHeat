#' Get Thermal Diffusivity of Food Materials
#'
#' Provides the thermal diffusivity (alpha) for various food items and materials
#' used in pasteurization simulations.
#'
#' @param food_name character Name of the material ("water", "meat", "vegetable", "stainless_steel").
#' @return numeric The thermal diffusivity value in mm^2/s.
#' @examples
#' alpha_val <- get_food_alpha("meat")
#' @export
get_food_alpha <- function(food_name) {
  alphas <- list(
    "water" = 0.143,
    "meat" = 0.12,
    "vegetable" = 0.15,
    "stainless_steel" = 4.0
  )

  if (!food_name %in% names(alphas)) {
    stop("Material not found. Choose from: ", paste(names(alphas), collapse = ", "))
  }

  return(alphas[[food_name]])
}
