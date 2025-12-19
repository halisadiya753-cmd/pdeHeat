#' Plot Heat Evolution Map
#'
#' Creates a contour plot to visualize the temperature distribution over time
#' and space, specifically tailored for pasteurization profiles.
#'
#' @param U matrix Numerical solution matrix (rows: time, columns: position).
#' @importFrom graphics filled.contour
#' @importFrom grDevices terrain.colors
#' @details The function uses a filled contour plot where the x-axis represents
#' time steps and the y-axis represents the spatial position along the object.
#'
#' @return NULL (displays a plot)
#' @examples
#' U <- matrix(seq(0, 1, length.out = 100), nrow = 10)
#' plot_heat_map(U)
#' @export
plot_heat_map <- function(U) {
  filled.contour(U,
                 xlab = "Time Steps",
                 ylab = "Spatial Position (x)",
                 main = "Temperature Profile during Pasteurization",
                 color.palette = terrain.colors)
}
