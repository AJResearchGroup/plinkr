test_that("create, read, save, read, PLINK2", {
  skip("Need 'save_pgen_table_to_file'")
  if (!is_plink_installed(plink_options = create_plink_v2_0_options())) return()

  pgen_filename <- get_plinkr_tempfilename(fileext = ".pgen")
  save_pgen_table_to_file(
    pgen_table = get_test_pgen_table(),
    pgen_filename = pgen_filename
  )

  expect_true(file.exists(pgen_filename))
  file.remove(pgen_filename)

  unlink(folder_name, recursive = TRUE)

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})
