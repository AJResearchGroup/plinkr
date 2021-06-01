test_that("minimal use", {
  expect_silent(clear_plinkr_cache())
})

test_that("create file", {
  filename <- get_plinkr_tempfilename()
  dir.create(dirname(filename), showWarnings = FALSE, recursive = TRUE)
  readr::write_lines("irrelevant", file = filename)
  expect_equal(1, length(list.files(folder)))
  expect_silent(clear_plinkr_cache())
  expect_equal(0, length(list.files(folder)))
})

test_that("create dir", {

  folder_name <- get_plinkr_tempfilename()
  dir.create(folder_name, showWarnings = FALSE, recursive = TRUE)
  expect_equal(2, length(list.dirs(folder)))
  expect_silent(clear_plinkr_cache())
  expect_equal(0, length(list.dirs(folder)))
})
