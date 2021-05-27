test_that("use", {
  if (is_plink_installed()) {
    expect_silent(check_plink_is_installed())
  }

  expect_error(
    check_plink_is_installed(plink_folder = get_plinkr_tempfilename()),
    "PLINK is not installed"
  )
})
