test_that("use", {
  simfreq_filename <- system.file(
    "extdata",
    "plink.simfreq",
    package = "plinkr"
  )
  simfreqs <- read_plink_simfreq_file(
    simfreq_filename = simfreq_filename
  )
  expect_true("n_snps" %in% names(simfreqs))
  expect_true("label" %in% names(simfreqs))
  expect_true("allele_frequency_lower_bound" %in% names(simfreqs))
  expect_true("allele_frequency_upper_bound" %in% names(simfreqs))
  expect_true("additive_genetic_variance" %in% names(simfreqs))
  expect_true("dominance_deviation" %in% names(simfreqs))
})
