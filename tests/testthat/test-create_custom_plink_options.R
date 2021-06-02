test_that("custom", {
  plink_exe_path <- "plink3.mp4"
  plink_options <- create_custom_plink_options(plink_exe_path)
  expect_equal("custom", plink_options$plink_version)
  expect_equal(plink_exe_path, plink_options$plink_exe_path)
})
