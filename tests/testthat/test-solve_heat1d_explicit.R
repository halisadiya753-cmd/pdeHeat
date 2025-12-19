test_that("explicit solver returns matrix of correct size", {
  x <- seq(0, 1, length.out = 20)
  u0 <- initial_condition(x)

  U <- solve_heat1d_explicit(
    u0 = u0,
    L = 1,
    alpha = 0.1,
    dt = 0.001,
    t = 0.01
  )

  expect_true(is.matrix(U))
  expect_equal(ncol(U), length(u0))
})



test_that("explicit solver fails if stability condition violated", {
  x <- seq(0, 1, length.out = 10)
  u0 <- initial_condition(x)

  expect_error(
    solve_heat1d_explicit(u0, L = 1, alpha = 10, dt = 1, t = 1)
  )
})

