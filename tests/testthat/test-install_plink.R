test_that("un- or install in temp plink folder", {
  if (!is_on_ci()) return()

  plink_options <- create_plink_options(
    plink_folder = get_plinkr_tempfilename()
  )
  expect_false(is_plink_installed(plink_options))
  expect_silent(install_plink(plink_options))
  expect_true(is_plink_installed(plink_options))
  expect_silent(uninstall_plink(plink_options))
  expect_false(is_plink_installed(plink_options))
  unlink(plink_options$plink_folder, recursive = TRUE)
})

test_that("un- or install in temp plink folder, v1.7", {
  if (!is_on_ci()) return()

  plink_options <- create_plink_v1_7_options(
    plink_folder = get_plinkr_tempfilename()
  )
  expect_false(is_plink_installed(plink_options))
  expect_silent(install_plink(plink_options))
  expect_true(is_plink_installed(plink_options))
  expect_silent(uninstall_plink(plink_options))
  expect_false(is_plink_installed(plink_options))
  unlink(plink_options$plink_folder, recursive = TRUE)
})

test_that("un- or install in temp plink folder, v1.9", {
  if (!is_on_ci()) return()

  plink_options <- create_plink_v1_9_options(
    plink_folder = get_plinkr_tempfilename()
  )
  expect_false(is_plink_installed(plink_options))
  expect_silent(install_plink(plink_options))
  expect_true(is_plink_installed(plink_options))
  expect_silent(uninstall_plink(plink_options))
  expect_false(is_plink_installed(plink_options))
  unlink(plink_options$plink_folder, recursive = TRUE)
})
