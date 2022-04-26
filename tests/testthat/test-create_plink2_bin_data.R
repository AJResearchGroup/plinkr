test_that("use", {
  pgen_table <- read_plink2_pgen_file_from_files(
    pgen_filename = get_plinkr_filename(
      "toy_v1_9_after_make-bed_after_make-pgen.pgen"
    ),
    psam_filename = get_plinkr_filename(
      "toy_v1_9_after_make-bed_after_make-pgen.psam"
    ),
    pvar_filename = get_plinkr_filename(
      "toy_v1_9_after_make-bed_after_make-pgen.pvar"
    )
  )
  psam_table <- plinkr::read_plink2_psam_file(
    psam_filename = get_plinkr_filename(
      "toy_v1_9_after_make-bed_after_make-pgen.psam"
    )
  )
  pvar_table <- read_plink2_pvar_file(
    pvar_filename = get_plinkr_filename(
      "toy_v1_9_after_make-bed_after_make-pgen.pvar"
    )
  )
  plink2_bin_data <- create_plink2_bin_data(
    pgen_table = pgen_table,
    psam_table = psam_table,
    pvar_table = pvar_table
  )
  expect_true(is_plink2_bin_data(plink2_bin_data))
})
