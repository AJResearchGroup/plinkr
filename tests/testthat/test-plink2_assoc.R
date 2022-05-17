test_that("minimal use", {
  if (!is_plink_installed()) return()
  skip("Need help of 'pgenlibr' to save a .pgen file")
  clear_plinkr_cache()
  expect_silent(
    plink2_assoc(
      assoc_data = create_test_assoc_data(
        data = create_test_plink2_bin_data()
      ),
      assoc_params = create_test_assoc_params(),
      plink_options = create_plink_v2_0_options()
    )
  )
  expect_silent(check_empty_plinkr_folder())
})

test_that("minimal use, from files without phenotypes", {
  if (!is_plink_installed()) return()

  clear_plinkr_cache()

  expect_silent(check_empty_plinkr_folder())
  expect_error(
    plink2_assoc(
      assoc_data = create_test_assoc_data(
        data = create_plink2_bin_filenames(
          pgen_filename = get_plinkr_filename("select_snps_plink2.pgen"),
          psam_filename = get_plinkr_filename("select_snps_plink2.psam"),
          pvar_filename = get_plinkr_filename("select_snps_plink2.pvar")
        )
      ),
      assoc_params = create_test_assoc_params(),
      plink_options = create_plink_v2_0_options()
    ),
    "No phenotypes loaded"
  )
  expect_silent(check_empty_plinkr_folder())
})
