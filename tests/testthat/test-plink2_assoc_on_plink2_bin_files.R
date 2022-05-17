test_that("use, #48", {
  skip("Issue #48")
  if (!is_plink_installed()) return()
  plink2_assoc_on_plink2_bin_files(
    assoc_data = create_assoc_data(create_test_plink2_bin_filenames()),
    assoc_params = create_test_assoc_params()
  )
})
