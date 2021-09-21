test_that("use", {
  bim_table <- get_test_bim_table()
  bim_filename <- get_plinkr_tempfilename(fileext = ".bim")
  save_bim_table_to_file(
    bim_table = bim_table,
    bim_filename = bim_filename
  )
  expect_true(file.exists(bim_filename))
  file.remove(bim_filename)

  check_empty_plinkr_folder()
  # clear_plinkr_cache() # nolint
})

test_that("sub-sub-sub folder", {
  bim_table <- get_test_bim_table()
  bim_filename <- file.path(
    get_plinkr_tempfilename(),
    "sub", "sub", "sub", "folder", "test.bim"
  )
  save_bim_table_to_file(
    bim_table = bim_table,
    bim_filename = bim_filename
  )
  expect_true(file.exists(bim_filename))
  file.remove(bim_filename)
  unlink(
    dirname(dirname(dirname(dirname(dirname(bim_filename))))),
    recursive = TRUE
  )
})

test_that("Give error due to too high chromosome number", {
  set.seed(314)
  assoc_params_with_plink_text_data <- create_demo_assoc_params(
    n_individuals = 2
  )
  assoc_params_with_plink_bin_data <- assoc_params_with_plink_text_data
  assoc_params_with_plink_bin_data$data <- convert_plink_text_data_to_plink_bin_data(
    assoc_params_with_plink_text_data$data
  )
  assoc_params_with_plink_bin_data$data$bim_table$chr <- 123
  expect_error(
    save_bim_table_to_file(
      bim_table = assoc_params_with_plink_bin_data$data$bim_table,
      bim_filename = "irrelevant_except_for_the_extension.bim"
    ),
    "default PLINK can handle a maximum of 95 chromosomes"
  )

  check_empty_plinkr_folder()
  # clear_plinkr_cache() # nolint

})

test_that("write to impossible folder", {
  # Windows has no impossible folders
  if (get_os() == "win") return()

  bim_table <- get_test_bim_table()
  bim_filename <- "/root/test.bim"

  # Error by genio
  expect_error(
    save_bim_table_to_file(
      bim_table = bim_table,
      bim_filename = bim_filename
    ),
    "Cannot open file for writing"
  )
})
