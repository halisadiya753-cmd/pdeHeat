test_that("plot_heat_map executes without error", {
  # Création d'une matrice de test
  U <- matrix(seq(0, 1, length.out = 100), nrow = 10)

  # On vérifie que l'appel à la fonction ne produit pas d'erreur
  expect_error(plot_heat_map(U), NA)
})
