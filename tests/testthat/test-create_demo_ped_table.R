test_that("use", {
  expect_silent(create_demo_ped_table())
  expect_silent(check_ped_table(create_demo_ped_table()))
})

test_that("random", {
  ped_table <- create_demo_ped_table(phenotypes = "random")
})

test_that("additive", {
  ped_table <- create_demo_ped_table(phenotypes = "additive")
  expect_silent(
    calc_additive_phenotype_values(snvs = ped_table[, c(7, 8)])
  )
})
