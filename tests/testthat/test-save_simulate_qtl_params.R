test_that("use", {
  expect_silent(check_empty_plinkr_folder())

  sim_filename <- get_plinkr_tempfilename()
  simulate_qt_params <- create_test_simulate_qt_params()
  save_simulate_qt_params(
    simulate_qt_params = simulate_qt_params,
    sim_filename = sim_filename
  )
  expect_true(file.exists(sim_filename))
  file.remove(sim_filename)

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})
