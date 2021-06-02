test_that("v1.7", {
  plink_options <- create_plink_v1_7_options()
  expect_equal("1.7", plink_options$plink_version)
  expect_true(stringr::str_detect(plink_options$plink_exe_path, "plink_1_7_"))
  expect_true(
    stringr::str_detect(plink_options$plink_exe_path, "plink(\\.exe)?$")
  )
})

test_that("v1.7", {
  plink_options <- create_plink_v1_7_options(os = "unix")
  expect_true(
    stringr::str_detect(plink_options$plink_exe_path, "plink_1_7_unix")
  )
})
