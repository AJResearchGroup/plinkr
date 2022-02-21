test_that("minimal use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_plink_installed(plink_options = create_plink_v2_0_options())) return()

  clear_plinkr_cache()

  expect_true(
    is_plink2_bin_data(
      convert_plink_bin_data_to_plink2_bin_data(
        plink_bin_data = create_test_plink_bin_data()
      )
    )
  )

  expect_silent(check_empty_plinkr_folder())
})

test_that("PLINK1 does not convert PLINK1 bin to PLINK2 binary", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_plink_installed(plink_options = create_plink_v1_7_options())) return()
  if (!is_plink_installed(plink_options = create_plink_v1_9_options())) return()

  clear_plinkr_cache()

  expect_error(
    convert_plink_bin_data_to_plink2_bin_data(
      plink_bin_data = create_test_plink_bin_data(),
      plink_options = create_plink_v1_7_options()
    ),
    "PLINK cannot convert '.bed', '.bim' and '.fam' files"
  )
  expect_error(
    convert_plink_bin_data_to_plink2_bin_data(
      plink_bin_data = create_test_plink_bin_data(),
      plink_options = create_plink_v1_9_options()
    ),
    "PLINK cannot convert '.bed', '.bim' and '.fam' files"
  )

  expect_silent(check_empty_plinkr_folder())
})
