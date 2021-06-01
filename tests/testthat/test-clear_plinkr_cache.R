test_that("minimal use", {
  expect_silent(clear_plinkr_cache())
})

test_that("create file", {
  plinkr_cache_folder_name <- dirname(get_plinkr_tempfilename())

  filename <- get_plinkr_tempfilename()
  dir.create(dirname(filename), showWarnings = FALSE, recursive = TRUE)
  readr::write_lines("irrelevant", file = filename)
  expect_equal(1, length(list.files(plinkr_cache_folder_name)))
  expect_silent(clear_plinkr_cache())
  expect_equal(0, length(list.files(plinkr_cache_folder_name)))
})

test_that("create dir", {
  plinkr_cache_folder_name <- dirname(get_plinkr_tempfilename())

  folder_name <- get_plinkr_tempfilename()
  dir.create(folder_name, showWarnings = FALSE, recursive = TRUE)
  expect_equal(2, length(list.dirs(plinkr_cache_folder_name)))
  expect_silent(clear_plinkr_cache())
  expect_equal(0, length(list.dirs(plinkr_cache_folder_name)))
})
