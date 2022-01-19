test_that("use", {
  fam_table <- get_test_fam_table()
  fam_filename <- get_plinkr_tempfilename(fileext = ".fam")
  save_fam_table(
    fam_table = fam_table,
    fam_filename = fam_filename
  )
  expect_true(file.exists(fam_filename))
  file.remove(fam_filename)

  check_empty_plinkr_folder()
  clear_plinkr_cache() # nolint
})

test_that("sub-sub-sub folder", {
  fam_table <- get_test_fam_table()
  fam_filename <- file.path(
    get_plinkr_tempfilename(),
    "sub", "sub", "sub", "folder", "test.fam"
  )
  save_fam_table(
    fam_table = fam_table,
    fam_filename = fam_filename
  )
  expect_true(file.exists(fam_filename))
  file.remove(fam_filename)
  unlink(
    dirname(dirname(dirname(dirname(dirname(fam_filename))))),
    recursive = TRUE
  )
})

test_that("use", {
  fam_table <- get_test_fam_table()
  fam_filename <- get_plinkr_tempfilename(fileext = ".fam")
  save_fam_table(
    fam_table = fam_table,
    fam_filename = fam_filename
  )
  expect_true(file.exists(fam_filename))
  file.remove(fam_filename)

  check_empty_plinkr_folder()
  clear_plinkr_cache() # nolint
})

test_that("must have .fam extension", {
  expect_error(
    save_fam_table(
      fam_table = get_test_fam_table(),
      fam_filename = "irrelevant.not_fam"
    ),
    "must have the '.fam' filename extension"
  )
})

test_that("write to impossible folder", {
  # Windows has no impossible folders
  if (get_os() == "win") return()

  fam_table <- get_test_fam_table()
  fam_filename <- "/root/test.fam"

  # Error by genio
  expect_error(
    save_fam_table(
      fam_table = fam_table,
      fam_filename = fam_filename
    ),
    "Cannot open file for writing"
  )
})
