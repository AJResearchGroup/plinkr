test_that("use", {
  sim_filename <- get_plinkr_tempfilename(
    "save_simulate_qt_params_to_file_",
    fileext = ".sim"
  )
  simulate_qt_params <- create_test_simulate_qt_params()
  save_simulate_qt_params_to_file(
    simulate_qt_params = simulate_qt_params,
    sim_filename = sim_filename
  )
  expect_true(file.exists(sim_filename))
})
