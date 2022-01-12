test_that("minimal use", {
  clear_plinkr_cache() # nolint

  if (!is_plink_installed(plink_options = create_plink_v1_9_options())) return()
  if (!is_plink_installed(plink_options = create_plink_v2_0_options())) return()

  expect_true(
    is_plink2_bin_data(
      convert_plink_text_data_to_plink2_bin_data(
        plink_text_data = create_test_plink_text_data()
      )
    )
  )

  expect_silent(check_empty_plinkr_folder())
})

test_that("PLINK2 does not convert PLINK1 text to PLINK1 binary", {
  clear_plinkr_cache() # nolint

  if (!is_plink_installed(plink_options = create_plink_v2_0_options())) return()

  expect_error(
    convert_plink_text_data_to_plink2_bin_data(
      plink_text_data = create_test_plink_text_data(),
      plink1_options = create_plink_v2_0_options()
    ),
    "PLINK2 cannot convert '.map' and '.ped' files"
  )

  expect_silent(check_empty_plinkr_folder())
})
