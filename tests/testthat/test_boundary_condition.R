test_that("boundary_condition creates functional list", {
  # Test avec des valeurs numériques simples
  bc <- boundary_condition(left = 85, right = 20)

  # Vérification du type de l'objet principal
  expect_type(bc, "list")

  # CORRECTION : Utilisation de is.function() à l'intérieur de expect_true()
  expect_true(is.function(bc$left))
  expect_true(is.function(bc$right))

  # Vérifier que l'appel de la fonction renvoie la bonne valeur
  expect_equal(bc$left(10), 85)
  expect_equal(bc$right(500), 20)
})
