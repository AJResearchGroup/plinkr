test_that("minimal use", {
  skip("Does not delete all files yet")
  expect_silent(check_empty_plinkr_folder())

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
  clear_plinkr_cache() # nolint
})

test_that("PLINK2 does not convert PLINK1 text to PLINK1 binary", {
  skip("Not now")
  expect_silent(check_empty_plinkr_folder())

  if (!is_plink_installed(plink_options = create_plink_v2_0_options())) return()

  expect_error(
    convert_plink_text_data_to_plink2_bin_data(
      plink_text_data = create_test_plink_text_data(),
      plink_options = create_plink_v2_0_options()
    ),
    "PLINK2 cannot convert '.map' and '.ped' files"
  )

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache() # nolint
})
