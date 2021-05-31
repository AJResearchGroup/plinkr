test_that("use", {
  expect_silent(create_demo_ped_table())
  expect_silent(check_ped_table(create_demo_ped_table()))
})

test_that("random, 1 SNP", {
  ped_table <- create_demo_ped_table(
    traits = create_random_trait()
  )
  expect_silent(check_ped_table(ped_table))
})

test_that("random, 2 SNPs", {
  ped_table <- create_demo_ped_table(
    traits = create_random_trait(n_snps = 2)
  )
  expect_true("snv_2a" %in% names(ped_table))
})

test_that("additive", {
  ped_table <- create_demo_ped_table(
    traits = create_additive_trait()
  )
  expect_silent(
    calc_additive_phenotype_values(snvs = ped_table[, c(7, 8)])
  )
  expect_silent(check_ped_table(ped_table))
})

test_that("random", {
  n_individuals <- 314
  ped_table <- create_demo_ped_table(
    n_individuals = n_individuals
  )
  expect_silent(check_ped_table(ped_table))
  expect_equal(nrow(ped_table), n_individuals)
})
