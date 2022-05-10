test_that("use", {
  eigenval_table <- read_plink_eigenval_file(
    eigenval_filename = get_plinkr_filename("pca.eigenval")
  )
  expect_true("eigenval" %in% names(eigenval_table))
  expect_equal(20, nrow(eigenval_table))
})
