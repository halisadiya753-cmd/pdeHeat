test_that("thomas solver solves a simple system", {
  a <- c(-1, -1)
  b <- c(2, 2, 2)
  c <- c(-1, -1)
  d <- c(1, 0, 1)

  x <- thomas_solve(a, b, c, d)

  expect_length(x, 3)
  expect_true(is.numeric(x))
})
