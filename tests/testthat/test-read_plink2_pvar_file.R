test_that("minimal use", {
  expect_silent(
    read_plink2_pvar_file(
      get_plinkr_filename("toy_v1_9_after_make-bed_after_make-pgen.pvar")
    )
  )
})

test_that("create, read, save, read, PLINK2", {
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

  # Read the table again
  pvar_table_again <- read_plink2_pvar_file(
    pvar_filename = pvar_filename_again
  )

  expect_identical(pvar_table, pvar_table_again)

  file.remove(pvar_filename_again)

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})
