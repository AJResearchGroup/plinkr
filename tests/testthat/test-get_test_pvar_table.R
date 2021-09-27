test_that("must match 'toy_v1_9_after_make-bed_after_make-pgen.pvar'", {
  pvar_table <- get_test_pvar_table()
  pvar_table_again <- read_plink2_pvar_file(
    get_plinkr_filename("toy_v1_9_after_make-bed_after_make-pgen.pvar")
  )
  expect_identical(pvar_table, pvar_table_again)
})
