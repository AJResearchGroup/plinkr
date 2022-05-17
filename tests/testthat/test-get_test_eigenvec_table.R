test_that("use", {
  eigenvec_table <- read_plink_eigenvec_file(
    eigenvec_filename = get_plinkr_filename("pca.eigenvec")
  )
  expect_identical(
    eigenvec_table,
    get_test_eigenvec_table()
  )
})
