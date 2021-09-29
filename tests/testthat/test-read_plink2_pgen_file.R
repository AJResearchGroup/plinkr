test_that("minimal use", {
  expect_silent(
    read_plink2_pgen_file(
      get_plinkr_filename("toy_v1_9_after_make-bed_after_make-pgen.pgen")
    )
  )
})

test_that("create, read, save, read, PLINK2", {
  skip("Need 'save_pgen_table'")
  if (!is_plink_installed(plink_options = create_plink_v2_0_options())) return()

  pgen_filename <- get_plinkr_filename(
    "toy_v1_9_after_make-bed_after_make-pgen.pgen"
  )

  # Read the table
  pgen_table <- read_plink2_pgen_file(pgen_filename = pgen_filename)

  # Save the table
  pgen_filename_again <- get_plinkr_tempfilename(fileext = ".pgen")
  save_pgen_table(
    pgen_table = pgen_table,
    pgen_filename = pgen_filename_again
  )

  # Read the table again
  pgen_table_again <- read_plink2_pgen_file(
    pgen_filename = pgen_filename_again
  )

  expect_identical(pgen_table, pgen_table_again)

  file.remove(pgen_filename_again)
  unlink(folder_name, recursive = TRUE)

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})
