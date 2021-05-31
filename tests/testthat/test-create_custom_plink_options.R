test_that("custom", {
  plink_folder <- "my_custom_plink_path"
  plink_options <- create_custom_plink_options(plink_folder)
  expect_equal("custom", plink_options$plink_version)
  expect_equal(plink_folder, plink_options$plink_folder)
})
