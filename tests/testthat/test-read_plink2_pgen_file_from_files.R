test_that("minimal use, test_v1_7_after_make-bed_after_make-pgen.pgen", {
  expect_silent(
    read_plink2_pgen_file_from_files(
      pgen_filename = get_plinkr_filename(
        "test_v1_7_after_make-bed_after_make-pgen.pgen"
      ),
      psam_filename = get_plinkr_filename(
        "test_v1_7_after_make-bed_after_make-pgen.psam"
      ),
      pvar_filename = get_plinkr_filename(
        "test_v1_7_after_make-bed_after_make-pgen.pvar"
      )
    )
  )
})

test_that("minimal use, toy_v1_9_after_make-bed_after_make-pgen.pgen", {
  expect_silent(
    read_plink2_pgen_file_from_files(
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
  )
})
