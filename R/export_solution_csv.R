#' Export the solution matrix to a csv file
#'
#' @param U matrix Numerical solution matrix of the PDE
#' @param file character Name of the output CSV file (default: "solution.csv")
#'
#' @returns NULL (side effect:writes a CSV file to disk)
#'
#' @examples
#' U <- matrix(runif(100), nrow= 10)
#' export_solution_csv(U, "test_solution.csv")
#' if(file.exists("test_solution.csv")) file.remove("test_solution.csv")
#' @export
export_solution_csv <- function(U, file="solution.csv"){
  utils::write.csv(U, file, row.names=FALSE)
}
