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

  expect_error(check_calc_phenotype_function("nonsense"))
  expect_error(check_calc_phenotype_function(""))
  expect_error(check_calc_phenotype_function(c()))
  expect_error(check_calc_phenotype_function(NULL))
  expect_error(check_calc_phenotype_function(NA))
  expect_error(check_calc_phenotype_function(Inf))
  expect_error(check_calc_phenotype_function(42))
  expect_error(check_calc_phenotype_function(3.14))
})

test_that("most return as much values as rows in snvs", {
  calc_phenotype_function <- function(snvs) {
    rep(42, nrow(snvs) + 1)
  }
  snvs <- tibble::tibble(snv_1a = "A", snv_1b = "A")
  expect_silent(calc_phenotype_function(snvs))
  expect_error(
    check_calc_phenotype_function(calc_phenotype_function),
    "must return as much phenotypes as there are individuals"
  )
})
