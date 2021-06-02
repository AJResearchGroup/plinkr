test_that("use", {
  if (is_plink_installed()) {
    expect_silent(check_plink_is_installed())
  }
})

test_that("Executable is not found", {
  if (!is_on_ci()) return()
  plink_options <- create_plink_v1_7_options(
    plink_folder = get_plinkr_tempfilename()
  )
  install_plink(plink_options)
  exe_path <- plink_options$plink_exe_path
  file.remove(exe_path)
  expect_error(
    check_plink_is_installed(plink_options),
    "Executable is not found"
  )
  unlink(plink_options$plink_folder, recursive = TRUE)
})

test_that("PLINK binary is not executable", {
  if (!is_on_ci()) return()
  if (get_os() == "win") return()
  plink_options <- create_plink_v1_9_options(
    plink_folder = get_plinkr_tempfilename()
  )
  install_plink(plink_options)
  exe_path <- plink_options$plink_exe_path
  expect_true(file.exists(exe_path))
  Sys.chmod(exe_path, "000")
  expect_false(is_exe(exe_path))

  expect_error(
    check_plink_is_installed(plink_options),
    "PLINK binary is not executable"
  )
  unlink(plink_options$plink_folder, recursive = TRUE)
})
