test_that("use", {
  assoc_params <- create_demo_assoc_params()
  expect_silent(check_assoc_params(assoc_params))
})

test_that("n_individuals", {
  n_individuals <- 5
  assoc_params <- create_demo_assoc_params(
    n_individuals = n_individuals
  )
  expect_silent(check_assoc_params(assoc_params))
  expect_equal(n_individuals, nrow(assoc_params$ped_table))
})

test_that("random", {
  expect_silent(
    create_demo_assoc_params(
      trait = create_random_trait()
    )
  )
})

test_that("random, other MAF", {
  expect_silent(
    create_demo_assoc_params(
      trait = create_random_trait(maf = 0.1)
    )
  )
})

test_that("additive", {
  expect_silent(
    create_demo_assoc_params(
      trait = create_additive_trait()
    )
  )
})

test_that("epistatic", {
  expect_silent(
    create_demo_assoc_params(
      trait = create_epistatic_trait()
    )
  )
})

test_that("number of individuals", {
  expect_silent(
    create_demo_assoc_params(
      n_individuals = 3,
      trait = create_random_trait()
    )
  )
})

test_that("Triallelic SNPs", {
  expect_silent(
    create_demo_assoc_params(
      trait = create_random_trait(mafs = c(0.3, 0.2)),
      n_individuals = 10
    )
  )
})

test_that("Quadallelic SNPs", {
  expect_silent(
    create_demo_assoc_params(
      trait = create_random_trait(mafs = c(0.3, 0.2, 0.1)),
      n_individuals = 10
    )
  )
})
