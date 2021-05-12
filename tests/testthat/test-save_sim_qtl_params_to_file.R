test_that("use", {
  sim_filename <- tempfile("save_sim_qt_params_to_file_", fileext = ".sim")
  sim_qt_params <- create_test_sim_qt_params()
  save_sim_qt_params_to_file(
    sim_qt_params = sim_qt_params,
    sim_filename = sim_filename
  )
  expect_true(file.exists(sim_filename))
})
