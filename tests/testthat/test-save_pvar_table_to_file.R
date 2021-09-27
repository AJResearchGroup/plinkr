test_that("exactly re-recreate .pvar file", {
  if (!is_plink_installed(plink_options = create_plink_v2_0_options())) return()

  pvar_filename <- get_plinkr_filename(
    "toy_v1_9_after_make-bed_after_make-pgen.pvar"
  )

  # Read the table
  pvar_table <- read_plink2_pvar_file(pvar_filename = pvar_filename)

  # Save the table
  pvar_filename_again <- get_plinkr_tempfilename(fileext = ".pvar")
  save_pvar_table_to_file(
    pvar_table = pvar_table,
    pvar_filename = pvar_filename_again
  )

  expect_true(file.exists(pvar_filename_again))
  expect_equal(
    readr::read_lines(pvar_filename),
    readr::read_lines(pvar_filename_again)
  )
  expect_equal(
    as.vector(tools::md5sum(pvar_filename)),
    as.vector(tools::md5sum(pvar_filename_again))
  )
  file.remove(pvar_filename_again)

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})
