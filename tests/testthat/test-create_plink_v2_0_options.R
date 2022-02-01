test_that("default", {
  clear_plinkr_cache()
  plink_options <- create_plink_v2_0_options()
  expect_equal("2.0", plink_options$plink_version)
  expect_true(stringr::str_detect(plink_options$plink_exe_path, "plink_2_0_"))
  expect_true(
    stringr::str_detect(plink_options$plink_exe_path, "plink2(\\.exe)?$")
  )
  expect_silent(check_empty_plinkr_folder())
})

test_that("Windows", {
  clear_plinkr_cache()

  expect_silent(check_empty_plinkr_folder())
  plink_options <- create_plink_v2_0_options(os = "win")
  expect_true(
    stringr::str_detect(plink_options$plink_exe_path, "plink_2_0_win")
  )
  expect_silent(check_empty_plinkr_folder())
})
