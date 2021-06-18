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
    42
  }
  expect_error(
    check_calc_phenotype_function(calc_phenotype_function),
    "must return as much phenotypes as there are individuals"
  )
})

test_that("most return as much values as rows in snvs", {
  calc_phenotype_function <- function(snvs) {
    rep(42, 4)
  }
  expect_error(
    check_calc_phenotype_function(calc_phenotype_function),
    "must return as much phenotypes as there are individuals"
  )
})
