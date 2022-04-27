test_that("use", {
  assoc_data <- create_demo_assoc_data()
  expect_silent(check_assoc_data(assoc_data))
})

test_that("n_individuals", {
  if (!is_on_ci()) return()
  n_individuals <- 5
  assoc_data <- create_demo_assoc_data(
    n_individuals = n_individuals
  )
  expect_silent(check_assoc_data(assoc_data))
  expect_equal(n_individuals, nrow(assoc_data$data$ped_table))
})

test_that("random", {
  if (!is_on_ci()) return()
  expect_silent(
    create_demo_assoc_data(
      trait = create_random_trait()
    )
  )
})

test_that("random, other MAF", {
  if (!is_on_ci()) return()
  expect_silent(
    create_demo_assoc_data(
      trait = create_random_trait(maf = 0.1)
    )
  )
})

test_that("additive", {
  if (!is_on_ci()) return()
  expect_silent(
    create_demo_assoc_data(
      trait = create_additive_trait()
    )
  )
})

test_that("epistatic", {
  if (!is_on_ci()) return()
  expect_silent(
    create_demo_assoc_data(
      trait = create_epistatic_trait()
    )
  )
})

test_that("number of individuals", {
  if (!is_on_ci()) return()
  expect_silent(
    create_demo_assoc_data(
      n_individuals = 3,
      trait = create_random_trait()
    )
  )
})

test_that("Triallelic SNPs", {
  if (!is_on_ci()) return()
  expect_silent(
    create_demo_assoc_data(
      trait = create_random_trait(mafs = c(0.3, 0.2)),
      n_individuals = 10
    )
  )
})

test_that("Quadallelic SNPs", {
  if (!is_on_ci()) return()
  expect_silent(
    create_demo_assoc_data(
      trait = create_random_trait(mafs = c(0.3, 0.2, 0.1)),
      n_individuals = 10
    )
  )
})
