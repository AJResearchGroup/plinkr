test_that("exactly re-recreate .psam file", {
  if (!is_plink_installed(plink_options = create_plink_v2_0_options())) return()

  psam_filename <- get_plinkr_filename(
    "toy_v1_9_after_make-bed_after_make-pgen.psam"
  )

  # Read the table
  psam_table <- read_plink2_psam_file(psam_filename = psam_filename)

  # Save the table
  psam_filename_again <- get_plinkr_tempfilename(fileext = ".psam")
  save_psam_table(
    psam_table = psam_table,
    psam_filename = psam_filename_again
  )

  expect_true(file.exists(psam_filename_again))
  expect_equal(
    readr::read_lines(psam_filename),
    readr::read_lines(psam_filename_again)
  )
  expect_equal(
    as.vector(tools::md5sum(psam_filename)),
    as.vector(tools::md5sum(psam_filename_again))
  )
  file.remove(psam_filename_again)

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})
