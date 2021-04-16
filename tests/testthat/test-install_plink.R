test_that("un- or install in temp plink folder", {
  if (!is_on_ci()) return()

  temp_folder <- tempfile()
  expect_false(is_plink_installed(plink_folder = temp_folder))
  expect_silent(install_plink(plink_folder = temp_folder))
  expect_true(is_plink_installed(plink_folder = temp_folder))
  expect_silent(uninstall_plink(plink_folder = temp_folder))
  expect_false(is_plink_installed(plink_folder = temp_folder))
})

