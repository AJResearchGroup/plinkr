test_that("default", {
  plink_options <- create_plink_v2_0_options()
  expect_equal("2.0", plink_options$plink_version)
  expect_true(stringr::str_detect(plink_options$plink_exe_path, "plink_2_0_"))
  expect_true(stringr::str_detect(plink_options$plink_exe_path, "plink2$"))
})

test_that("Windows", {
  plink_options <- create_plink_v2_0_options(os = "win")
  expect_true(
    stringr::str_detect(plink_options$plink_exe_path, "plink_2_0_win")
  )
})
