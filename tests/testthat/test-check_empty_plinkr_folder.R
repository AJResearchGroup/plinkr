test_that("tests should have cleaned up all their temp files", {
  if (get_os() == "win") return()

  expect_silent(check_empty_plinkr_folder())
})

test_that("non-existing folder is empty", {
  if (get_os() == "win") return()

  expect_silent(check_empty_plinkr_folder(get_plinkr_tempfilename()))
})

test_that("folders are detected", {
  if (get_os() == "win") return()

  plinkr_folder <- get_plinkr_tempfilename()
  plinkr_subfolder <- file.path(plinkr_folder, "subfolder")
  expect_silent(check_empty_plinkr_folder(plinkr_folder))
  dir.create(plinkr_subfolder, showWarnings = FALSE, recursive = TRUE)
  expect_error(check_empty_plinkr_folder(plinkr_folder))
  unlink(plinkr_folder, recursive = TRUE)
  expect_silent(check_empty_plinkr_folder(plinkr_folder))
})

test_that("files are detected", {
  if (get_os() == "win") return()

  plinkr_folder <- get_plinkr_tempfilename()
  dir.create(plinkr_folder, showWarnings = FALSE, recursive = TRUE)
  plinkr_filename <- file.path(plinkr_folder, basename(tempfile()))
  expect_silent(check_empty_plinkr_folder(plinkr_folder = plinkr_folder))
  readr::write_lines(x = "irrelevant", file = plinkr_filename)
  expect_error(check_empty_plinkr_folder(plinkr_folder = plinkr_folder))
  file.remove(plinkr_filename)
})
