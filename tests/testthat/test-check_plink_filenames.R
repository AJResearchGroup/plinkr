test_that("use", {
  expect_silent(check_plink_filenames(create_test_plink_text_filenames()))
  expect_silent(check_plink_filenames(create_test_plink_bin_filenames()))
  expect_silent(check_plink_filenames(create_test_plink2_bin_filenames()))

  expect_error(
    check_plink_filenames("nonsense"),
    "'plink_filenames' is not a collection of PLINK text files, PLINK binary files, nor PLINK2 binary files"
  )
  expect_error(check_plink_filenames(list(x = "nonsense")))
  expect_error(check_plink_filenames(""))
  expect_error(check_plink_filenames(NA))
  expect_error(check_plink_filenames(NULL))
  expect_error(check_plink_filenames(Inf))
  expect_error(check_plink_filenames(3.14))
  expect_error(check_plink_filenames(42))
  expect_error(check_plink_filenames(c("random", "")))
})
