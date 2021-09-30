test_that("use", {
  t <- read_plink2_qassoc_files(
    qassoc_filenames = c(
      get_plinkr_filename("plink2_assoc_output.additive.glm.linear"),
      get_plinkr_filename("plink2_assoc_output.random.glm.linear")
    )
  )
  expect_true("additive" %in% t$PHENO)
  expect_true("random" %in% t$PHENO)
})
