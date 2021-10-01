test_that("use", {
  plink2_bin_filenames <- create_plink2_bin_filenames(
    pgen_filename = "filename.pgen",
    psam_filename = "filename.psam",
    pvar_filename = "filename.pvar"
  )
  expect_silent(check_plink2_bin_filenames(plink2_bin_filenames))
  expect_error(check_plink2_bin_filenames("nonsense"))
  expect_error(check_plink2_bin_filenames(NULL))
  expect_error(check_plink2_bin_filenames(NA))
  expect_error(check_plink2_bin_filenames(42))
  expect_error(check_plink2_bin_filenames(3.14))
  expect_error(check_plink2_bin_filenames(c()))
  expect_error(check_plink2_bin_filenames(c(1, 2)))
  expect_error(check_plink2_bin_filenames(list()))
})
