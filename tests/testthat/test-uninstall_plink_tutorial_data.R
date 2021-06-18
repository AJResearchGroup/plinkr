test_that("use", {
  plink_folder <- get_plinkr_tempfilename()
  install_plink_tutorial_data(plink_folder = plink_folder)
  expect_true(is_plink_tutorial_data_installed(plink_folder = plink_folder))
  expect_silent(uninstall_plink_tutorial_data(plink_folder = plink_folder))
  expect_false(is_plink_tutorial_data_installed(plink_folder = plink_folder))
  expect_error(uninstall_plink_tutorial_data(plink_folder = plink_folder))
})
