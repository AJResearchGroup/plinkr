test_that("use", {
  clear_plinkr_cache()

  bim_table <- get_test_bim_table()
  bim_filename <- get_plinkr_tempfilename(fileext = ".bim")
  save_bim_table(
    bim_table = bim_table,
    bim_filename = bim_filename
  )
  expect_true(file.exists(bim_filename))
  file.remove(bim_filename)

  check_empty_plinkr_folder()
})

test_that("sub-sub-sub folder", {
  clear_plinkr_cache()

  bim_table <- get_test_bim_table()
  bim_filename <- file.path(
    get_plinkr_tempfilename(),
    "sub", "sub", "sub", "folder", "test.bim"
  )
  save_bim_table(
    bim_table = bim_table,
    bim_filename = bim_filename
  )
  expect_true(file.exists(bim_filename))
  file.remove(bim_filename)
  unlink(
    dirname(dirname(dirname(dirname(dirname(bim_filename))))),
    recursive = TRUE
  )
  check_empty_plinkr_folder()
})

test_that("filename must end with .bim", {
  clear_plinkr_cache()

  bim_table <- get_test_bim_table()
  bim_filename <- get_plinkr_tempfilename(fileext = ".not_bim")
  expect_error(
    save_bim_table(
      bim_table = bim_table,
      bim_filename = bim_filename
    ),
    "'bim_filename' must have the '.bim' filename extension"
  )
  check_empty_plinkr_folder()
})

test_that("Give error due to too high chromosome number", {
  if (!is_plink_installed()) return()

  clear_plinkr_cache()

  set.seed(314)
  data <- create_test_plink_bin_data()
  data$bim_table$chr <- 123
  expect_error(
    save_bim_table(
      bim_table = data$bim_table,
      bim_filename = "irrelevant_except_for_the_extension.bim"
    ),
    "default PLINK can handle a maximum of 95 chromosomes"
  )
  check_empty_plinkr_folder()
})

test_that("write to impossible folder", {
  # Windows has no impossible folders
  if (get_os() == "win") return()

  bim_table <- get_test_bim_table()
  bim_filename <- "/root/test.bim"

  # Error by genio
  expect_error(
    save_bim_table(
      bim_table = bim_table,
      bim_filename = bim_filename
    ),
    "Cannot open file for writing"
  )
})
