test_that("un- or install in temp plink folder", {
  if (!is_on_ci()) return()

  temp_folder <- tempfile()
  expect_false(is_plink_installed(plink_folder = temp_folder))
  expect_silent(install_plink(plink_folder = temp_folder))
  expect_true(is_plink_installed(plink_folder = temp_folder))
  expect_silent(uninstall_plink(plink_folder = temp_folder))
  expect_false(is_plink_installed(plink_folder = temp_folder))
})

test_that("un- or install in temp plink folder, v1.7", {
  if (!is_on_ci()) return()

  plink_folder <- tempfile()
  expect_false(is_plink_installed(plink_version = "1.7", plink_folder = plink_folder))
  expect_silent(install_plink(plink_version = "1.7", plink_folder = plink_folder))
  expect_true(is_plink_installed(plink_version = "1.7", plink_folder = plink_folder))
  expect_silent(uninstall_plink(plink_version = "1.7", plink_folder = plink_folder))
  expect_false(is_plink_installed(plink_version = "1.7", plink_folder = plink_folder))
})
