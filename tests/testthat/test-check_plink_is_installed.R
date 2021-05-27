test_that("use", {
  if (is_plink_installed()) {
    expect_silent(check_plink_is_installed())
  }
})

test_that("ZIP file not downloaded", {
  expect_error(
    check_plink_is_installed(plink_folder = get_plinkr_tempfilename()),
    "ZIP file not downloaded"
  )
})

test_that("Executable is not found", {
  if (!is_on_ci()) return()
  plink_folder <- get_plinkr_tempfilename()
  install_plink(plink_folder = plink_folder)
  exe_path <- get_plink_exe_path(plink_folder = plink_folder)
  file.remove(exe_path)
  expect_error(
    check_plink_is_installed(plink_folder = plink_folder),
    "Executable is not found"
  )
  unlink(plink_folder, recursive = TRUE)
})

test_that("PLINK binary is not executable", {
  if (!is_on_ci()) return()
  plink_folder <- get_plinkr_tempfilename()
  install_plink(plink_folder = plink_folder)
  exe_path <- get_plink_exe_path(plink_folder = plink_folder)
  expect_true(file.exists(exe_path))
  Sys.chmod(exe_path, "000")
  expect_false(is_exe(exe_path))

  expect_error(
    check_plink_is_installed(plink_folder = plink_folder),
    "PLINK binary is not executable"
  )
  unlink(plink_folder, recursive = TRUE)
})
