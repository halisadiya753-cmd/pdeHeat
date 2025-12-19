on.exit(if(file.exists("solution.csv")) file.remove("solution.csv"))
test_that("export_solution_csv creates a file", {
  U <- matrix(runif(20), nrow = 5)
  file <- tempfile(fileext = ".csv")

  export_solution_csv(U, file)

  expect_true(file.exists(file))
})
