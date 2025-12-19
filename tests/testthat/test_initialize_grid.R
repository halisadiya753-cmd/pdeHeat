library(testthat)

test_that("initialize_grid calcule correctement les paramètres par défaut", {
  # Test avec les valeurs par défaut (L=1, nx=101, t=1)
  grid <- initialize_grid()

  # Vérification des dimensions
  expect_equal(length(grid$x), 101)
  expect_equal(grid$nx, 101)

  # Vérification du calcul de dx : 1 / (101 - 1) = 0.01
  expect_equal(grid$dx, 0.01)

  # Vérification que le vecteur temps 'c' commence à 0 et finit à t
  expect_equal(min(grid$c), 0)
  expect_equal(max(grid$c), 1)
})

test_that("initialize_grid respecte les entrées nt personnalisées", {
  # On fixe nt = 10 pour t = 1, donc dt doit être 0.1
  grid <- initialize_grid(L = 10, nx = 11, t = 1, nt = 10)

  expect_equal(grid$dx, 1)    # 10 / (11-1) = 1
  expect_equal(grid$dt, 0.1)  # 1 / 10 = 0.1
  expect_equal(length(grid$c), 11) # nt + 1 points
})

test_that("initialize_grid gère les erreurs d'entrée", {
  # L négatif ou nul
  expect_error(initialize_grid(L = 0), "L must be positive numeric")
  expect_error(initialize_grid(L = -1), "L must be positive numeric")

  # nx trop petit
  expect_error(initialize_grid(nx = 2), "nx must be integer >=3")

  # t négatif ou nul
  expect_error(initialize_grid(t = 0), "t must be positive numeric")

  # nt invalide
  expect_error(initialize_grid(nt = 0), "nt must")
})

test_that("le calcul automatique de nt est cohérent", {
  # Si nt est NULL, dt doit être proche de dx^2
  grid <- initialize_grid(L = 1, nx = 11) # dx = 0.1, dx^2 = 0.01

  # Pour t=1 et dt=0.01, nt doit être 100
  expect_equal(grid$dt, 0.01)
  expect_equal(length(grid$c), 101)
})
