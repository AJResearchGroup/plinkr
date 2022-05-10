test_that("use", {
  eigenvec_table <- read_plink_eigenvec_file(
    eigenvec_filename = get_plinkr_filename("pca.eigenvec")
  )
  expect_true("fam" %in% names(eigenvec_table))
  expect_true("id" %in% names(eigenvec_table))
  expect_true("pc_1" %in% names(eigenvec_table))
})
