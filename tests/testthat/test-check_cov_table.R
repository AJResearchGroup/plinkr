test_that("use", {
  cov_table <- read_plink_phe_file(
    phe_filename = get_plinkr_filename("pheno.raw")
  )
  expect_silent(check_cov_table(cov_table))
})
