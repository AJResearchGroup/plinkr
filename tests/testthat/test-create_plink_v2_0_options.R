test_that("v2.0", {
  plink_options <- create_plink_v2_0_options()
  expect_equal("2.0", plink_options$plink_version)
  expect_equal(get_plink_folder(), plink_options$plink_folder)
})

test_that("v2.0, Linux", {
  plink_options <- create_plink_v2_0_options(os = "unix")
  expect_equal("unix", plink_options$os)
})
