test_that("musy match table as loaded from file", {
  pgen_table <- get_test_pgen_table()

  pgen_table_again <- plinkr::read_plink2_pgen_file_from_files(
    pgen_filename = plinkr::get_plinkr_filename(
      "toy_v1_9_after_make-bed_after_make-pgen.pgen"
    ),
    psam_filename = plinkr::get_plinkr_filename(
      "toy_v1_9_after_make-bed_after_make-pgen.psam"
    ),
    pvar_filename = plinkr::get_plinkr_filename(
      "toy_v1_9_after_make-bed_after_make-pgen.pvar"
    )
  )
  expect_identical(pgen_table, pgen_table_again)
})
