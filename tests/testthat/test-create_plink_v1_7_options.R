test_that("v1.7", {
  plink_options <- create_plink_v1_7_options()
  expect_equal("1.7", plink_options$plink_version)
  expect_equal(get_plink_folder(), plink_options$plink_folder)
})

test_that("v1.7, Linux", {
  plink_options <- create_plink_v1_7_options(os = "unix")
  expect_equal("unix", plink_options$os)
})
