test_that("minimal use", {
  expect_silent(
    create_sim_qt_params(
      n_snps = 10,
      snp_label = "test_qt",
      allele_frequency_lower = 0.05,
      allele_frequency_upper = 0.95,
      additive_genetic_variance = 0.01,
      ratio_dominance_to_additive = 0.0
    )
  )
})

test_that("must be valid", {
  expect_silent(
    check_sim_qt_params(
      create_sim_qt_params(
        n_snps = 10,
        snp_label = "test_qt",
        allele_frequency_lower = 0.05,
        allele_frequency_upper = 0.95,
        additive_genetic_variance = 0.01,
        ratio_dominance_to_additive = 0.0
      )
    )
  )
})
