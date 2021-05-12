test_that("minimal use", {
  expect_silent(
    create_sim_qtl_params(
      n_sns = 10,
      snp_label = "test_qtl",
      allele_frequency_lower = 0.05,
      allele_frequency_upper = 0.95,
      additive_genetic_variance = 0.01,
      ratio_dominance_to_additive = 0.0
    )
  )
})

test_that("must be valid", {
  skip("WIP")
  sim_qtl_params <- create_sim_qtl_params()
  expect_true(is_sim_qtl_params(sim_qtl_params))
})
