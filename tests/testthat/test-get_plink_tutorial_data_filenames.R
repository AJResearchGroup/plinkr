test_that("use", {
  if (is_plink_tutorial_data_installed()) {
    expect_silent(get_plink_tutorial_data_filenames())
  }
  expect_error(
    get_plink_tutorial_data_filenames(plink_folder = get_plinkr_tempfilename())
  )
})
