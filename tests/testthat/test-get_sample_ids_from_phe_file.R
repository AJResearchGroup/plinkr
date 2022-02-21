test_that("use", {
  clear_plinkr_cache()

  phe_filename <- get_plinkr_filename("demo_assoc_qt.phe")
  sample_ids <- get_sample_ids_from_phe_file(phe_filename)
  expect_silent(check_sample_ids(sample_ids))

  expect_silent(check_empty_plinkr_folder())
})
