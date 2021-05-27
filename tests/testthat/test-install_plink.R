test_that("un- or install in temp plink folder", {
  if (!is_on_ci()) return()

  temp_folder <- get_plinkr_tempfilename()
  expect_false(is_plink_installed(plink_folder = temp_folder))
  expect_silent(install_plink(plink_folder = temp_folder))
  expect_true(is_plink_installed(plink_folder = temp_folder))
  expect_silent(uninstall_plink(plink_folder = temp_folder))
  expect_false(is_plink_installed(plink_folder = temp_folder))
})

test_that("un- or install in temp plink folder, v1.7", {
  if (!is_on_ci()) return()

  plink_folder <- get_plinkr_tempfilename()
  expect_false(is_plink_installed(plink_version = "1.7", plink_folder = plink_folder)) # nolint long line indeed
  expect_silent(install_plink(plink_version = "1.7", plink_folder = plink_folder)) # nolint long line indeed
  expect_true(is_plink_installed(plink_version = "1.7", plink_folder = plink_folder)) # nolint long line indeed
  expect_silent(uninstall_plink(plink_version = "1.7", plink_folder = plink_folder)) # nolint long line indeed
  expect_false(is_plink_installed(plink_version = "1.7", plink_folder = plink_folder)) # nolint long line indeed
})

test_that("un- or install in temp plink folder, v1.9", {
  if (!is_on_ci()) return()

  plink_folder <- get_plinkr_tempfilename()
  expect_false(is_plink_installed(plink_version = "1.9", plink_folder = plink_folder)) # nolint long line indeed
  expect_silent(install_plink(plink_version = "1.9", plink_folder = plink_folder)) # nolint long line indeed
  expect_true(is_plink_installed(plink_version = "1.9", plink_folder = plink_folder)) # nolint long line indeed
  expect_silent(uninstall_plink(plink_version = "1.9", plink_folder = plink_folder)) # nolint long line indeed
  expect_false(is_plink_installed(plink_version = "1.9", plink_folder = plink_folder)) # nolint long line indeed
})
