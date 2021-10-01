test_that("minimal use", {
  expect_silent(
    create_plink2_bin_filenames(
      pgen_filename = "file.pgen",
      psam_filename = "file.psam",
      pvar_filename = "file.pvar"
    )
  )
})
