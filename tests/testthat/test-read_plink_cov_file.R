test_that("save and read must result in same table", {
  expect_silent(
    read_plink_cov_file(
      cov_filename = get_plinkr_filename("pheno.raw")
    )
  )
  expect_error(
    read_plink_cov_file(
      cov_filename = "nonsense"
    )
  )
})
