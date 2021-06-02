test_that("use", {
  expect_silent(get_default_plink_exe_path())
  expect_silent(get_default_plink_exe_path(plink_version = "1.7"))
  expect_silent(get_default_plink_exe_path(os = "win"))
})

test_that("abuse", {
  expect_error(
    get_default_plink_exe_path(plink_version = "custom"),
    "Cannot predict the PLINK executable path for a custom PLINK version"
  )
})
