test_that("minimal use", {
  expect_silent(check_calc_phenotype_function(calc_additive_phenotype_values))
  expect_silent(check_calc_phenotype_function(calc_epistatic_phenotype_values))
  expect_silent(
    check_calc_phenotype_function(
      calc_random_case_control_phenotype_values
    )
  )
  expect_silent(
    check_calc_phenotype_function(
      calc_random_phenotype_values
    )
  )
})
