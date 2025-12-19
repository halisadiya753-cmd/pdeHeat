test_that("get_food_alpha returns correct values and handles errors", {
  # Vérification des valeurs connues
  expect_equal(get_food_alpha("meat"), 0.12)
  expect_equal(get_food_alpha("water"), 0.143)
  expect_equal(get_food_alpha("vegetables"), 0.10)

  # Vérification de la gestion des erreurs
  expect_error(get_food_alpha("chocolate"), "Unknown food type")
})
