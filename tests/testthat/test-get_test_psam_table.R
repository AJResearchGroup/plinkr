test_that("must match 'toy_v1_9_after_make-bed_after_make-pgen.psam'", {

  psam_table <- get_test_psam_table()
  psam_table_again <- read_plink2_psam_file(
    psam_filename = get_plinkr_filename(
      "toy_v1_9_after_make-bed_after_make-pgen.psam"
    )
  )
  expect_identical(psam_table, psam_table_again)
})
