test_that("use", {
  clear_plinkr_cache()

  fam_filename <- get_plinkr_filename("demo_assoc_qt.fam")
  sample_ids <- get_sample_ids_from_fam_file(fam_filename)
  expect_silent(check_sample_ids(sample_ids))

  expect_silent(check_empty_plinkr_folder())
})
