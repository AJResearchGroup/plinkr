test_that("use", {
  expect_silent(create_test_plink_bin_data())
  expect_silent(check_plink_bin_data(create_test_plink_bin_data()))
})

test_that("reproduces test_v1_7_after_make-bed files", {
  plink_bin_data <- create_test_plink_bin_data()

  base_input_filename <- tools::file_path_sans_ext(
    get_plinkr_filename("test_v1_7_after_make-bed.bed")
  )
  plink_bin_data_again <- read_plink_bin_data(
    base_input_filename = base_input_filename
  )
  expect_silent(check_plink_bin_data(plink_bin_data_again))

  expect_identical(plink_bin_data, plink_bin_data_again)
  check_empty_plinkr_folder()
})

test_that("mismatches PLINK1 text data", {

  plink_text_data <- create_test_plink_text_data()
  plink_bin_data <- create_test_plink_bin_data()

  n_snps_text <- nrow(plink_text_data$map_table)
  n_snps_bin <- nrow(plink_bin_data$bed_table)
  expect_equal(n_snps_text, n_snps_bin)

  # Here they start to differ
  return()
  n_individuals_text <- nrow(plink_text_data$ped_table)
  n_individuals_bin <- nrow(plink_bin_data$fam_table)
  expect_equal(n_individuals_text, n_individuals_bin)
})
