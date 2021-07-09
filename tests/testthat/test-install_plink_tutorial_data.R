test_that("use", {
  plink_folder <- get_plinkr_tempfilename()
  expect_false(is_plink_tutorial_data_installed(plink_folder = plink_folder))
  install_plink_tutorial_data(plink_folder = plink_folder)
  expect_true(is_plink_tutorial_data_installed(plink_folder = plink_folder))
  expect_error(install_plink_tutorial_data(plink_folder = plink_folder))
  unlink(plink_folder, recursive = TRUE)
  if (get_os() != "win") expect_silent(check_empty_plinkr_folder())
})
