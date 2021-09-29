test_that("musy match table as loaded from file", {
  pgen_table <- get_test_pgen_table()
  pgen_table_again <- read_plink2_pgen_file(
    get_plinkr_filename("toy_v1_9_after_make-bed_after_make-pgen.pgen"),
    names_loci = c("rs0", "rs10"),
    names_ind = rep(1, 2)
  )
  expect_identical(pgen_table, pgen_table_again)
})
