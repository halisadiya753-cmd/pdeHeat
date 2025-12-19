test_that("check_safety validates pasteurization scenarios", {
  # Scénario 1 : ÉCHEC (Température trop basse)
  U_fail <- matrix(20, nrow = 10, ncol = 5) # 20°C partout
  # On s'attend à un warning car la pasteurisation échoue
  expect_warning(
    res_fail <- check_safety(U_fail, dt = 1, threshold = 72, required_time = 15)
  )
  expect_false(res_fail$safe)
  expect_equal(res_fail$duration_above, 0)

  # Scénario 2 : SUCCÈS (Température au centre à 75°C pendant 20s)
  # On crée une matrice de 20 lignes (20 secondes si dt=1)
  U_success <- matrix(75, nrow = 20, ncol = 5)
  # On s'attend à un message de confirmation
  expect_message(
    res_success <- check_safety(U_success, dt = 1, threshold = 72, required_time = 15)
  )
  expect_true(res_success$safe)
  expect_equal(res_success$duration_above, 20)
})
