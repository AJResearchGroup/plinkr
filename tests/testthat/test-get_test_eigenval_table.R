test_that("use", {
  eigenval_table <- read_plink_eigenval_file(
    eigenval_filename = get_plinkr_filename("pca.eigenval")
  )
  expect_identical(
    get_test_eigenval_table(),
    eigenval_table
  )
})
