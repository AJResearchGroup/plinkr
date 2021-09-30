test_that("musy match table as loaded from file", {
  pgen_table <- get_test_pgen_table()
  pgen_table_again <- read_plink2_pgen_file(
    get_plinkr_filename("test_v1_7_after_make-bed_after_make-pgen.pgen"),
    names_loci = c("snp1", "snp2"),
    names_ind = seq(1, 6)
  )
  expect_identical(pgen_table, pgen_table_again)
})
