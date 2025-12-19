test_that("initial_condition returns correct length", {
  x <- seq(0, 1, length.out = 50)
  u0 <- initial_condition(x, type = "constant", value = 2)

  expect_length(u0, length(x))
  expect_true(all(u0 == 2))
})

test_that("initial_condition spike has one non-zero value", {
  x <- seq(0, 1, length.out = 50)
  u0 <- initial_condition(x, type = "spike", value = 1)

  expect_equal(sum(u0 != 0), 1)
})
