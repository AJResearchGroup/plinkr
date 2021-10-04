test_that("use", {

  expect_equal(
    get_data_description(create_test_plink_text_data()),
    "PLINK text data"
  )
  expect_equal(
    get_data_description(create_test_plink_bin_data()),
    "PLINK binary data"
  )
  expect_equal(
    get_data_description(create_test_plink2_bin_data()),
    "PLINK2 binary data"
  )
  expect_equal(
    get_data_description(create_test_plink_text_filenames()),
    "PLINK text filenames"
  )
  expect_equal(
    get_data_description(create_test_plink_bin_filenames()),
    "PLINK binary filenames"
  )
  expect_equal(
    get_data_description(create_test_plink2_bin_filenames()),
    "PLINK2 binary filenames"
  )
})
