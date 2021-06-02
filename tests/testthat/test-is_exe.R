test_that("use on text file", {
  temp_filename <- get_plinkr_tempfilename()
  dir.create(dirname(temp_filename), showWarnings = FALSE, recursive = TRUE)
  writeLines(text = "temp", temp_filename)
  expect_false(is_exe(filename = temp_filename))
  file.remove(temp_filename)
  unlink(dirname(temp_filename), recursive = TRUE)
})

test_that("use on PLINK exe file", {
  if (!is_plink_installed()) return()
  expect_true(is_exe(create_plink_options()$plink_exe_path))
})
