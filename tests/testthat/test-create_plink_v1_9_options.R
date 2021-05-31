test_that("v1.9", {
  plink_options <- create_plink_v1_9_options()
  expect_equal("1.9", plink_options$plink_version)
  expect_equal(get_plink_folder(), plink_options$plink_folder)
})
