test_that("default", {
  plink_options <- create_plink_v1_9_options()
  expect_equal("1.9", plink_options$plink_version)
  expect_true(stringr::str_detect(plink_options$plink_exe_path, "plink_1_9_"))
  expect_true(stringr::str_detect(plink_options$plink_exe_path, "plink$"))
})

test_that("unix", {
  plink_options <- create_plink_v1_9_options(os = "unix")
  expect_true(
    stringr::str_detect(plink_options$plink_exe_path, "plink_1_9_unix")
  )
})
