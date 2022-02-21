test_that("use", {
  clear_plinkr_cache()

  sample_ids_filename <- get_plinkr_tempfilename(pattern = "save_sample_ids")
  expect_false(file.exists(sample_ids_filename))
  save_sample_ids(
    sample_ids = get_test_sample_ids(),
    sample_ids_filename = sample_ids_filename
  )
  expect_true(file.exists(sample_ids_filename))
  file.remove(sample_ids_filename)

  expect_silent(check_empty_plinkr_folder())
})
