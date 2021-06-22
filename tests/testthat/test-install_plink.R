test_that("un- or install in temp plink folder", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
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

test_that("un- or install in temp plink folder, v1.7", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
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

test_that("un- or install in temp plink folder", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_on_ci()) return()

  for (plink_version in get_plink_versions()) {
    for (os in c("unix", "mac", "windows")) {
      f <- NA
      if (plink_version == "1.7") f <- create_plink_v1_7_options
      if (plink_version == "1.9") f <- create_plink_v1_9_options
      if (plink_version == "2.0") f <- create_plink_v2_0_options
      expect_true(is.function(f))
      plink_options <- f(plink_folder = get_plinkr_tempfilename(), os = "win")
      expect_false(is_plink_installed(plink_options))
      expect_silent(install_plink(plink_options))
      expect_true(is_plink_installed(plink_options))
      expect_silent(uninstall_plink(plink_options))
      expect_false(is_plink_installed(plink_options))
      unlink(plink_options$plink_folder, recursive = TRUE)
    }
  }
})

test_that("install_plink tests cleans up temp files", {
  expect_silent(check_empty_plinkr_folder())
})
