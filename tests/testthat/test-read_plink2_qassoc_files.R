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

test_that("reading an absent file results in an empty table", {
  t_exists <- read_plink2_qassoc_files(
    qassoc_filenames = get_plinkr_filename(
      "plink2_assoc_output.additive.glm.linear")
  )
  t_absent <- read_plink2_qassoc_files(
    qassoc_filenames = "absent"
  )
  expect_equal(names(t_exists), names(t_absent))
})
