test_that("use", {
  assoc_qt_params <- create_demo_assoc_qt_params()
  expect_silent(check_assoc_qt_params(assoc_qt_params))
})

test_that("n_individuals", {
  n_individuals <- 31
  assoc_qt_params <- create_demo_assoc_qt_params(
    n_individuals = n_individuals
  )
  expect_silent(check_assoc_qt_params(assoc_qt_params))
  expect_equal(n_individuals, nrow(assoc_qt_params$ped_table))
  expect_equal(n_individuals, nrow(assoc_qt_params$phenotype_table))
})

test_that("MAFs", {
  n_individuals <- 100
  mafs <- c(0.31, 0.02)
  assoc_qt_params <- create_demo_assoc_qt_params(
    traits = list(
      create_random_trait(maf = mafs[1]),
      create_random_trait(maf = mafs[2])
    ),
    n_individuals = n_individuals
  )
  expect_silent(check_assoc_qt_params(assoc_qt_params))
  expect_equal(n_individuals, nrow(assoc_qt_params$ped_table))
  expect_equal(n_individuals, nrow(assoc_qt_params$phenotype_table))
  # First SNP
  n_expect_major_alleles <- n_individuals * (1.0 - mafs[1])
  expect_equal(
    n_expect_major_alleles,
    sum(assoc_qt_params$ped_table$snv_1a == "A")
  )
  expect_equal(
    n_expect_major_alleles,
    sum(assoc_qt_params$ped_table$snv_1b == "A")
  )
  # Second SNP
  n_expect_major_alleles <- n_individuals * (1.0 - mafs[2])
  expect_equal(
    n_expect_major_alleles,
    sum(assoc_qt_params$ped_table$snv_2a == "A")
  )
  expect_equal(
    n_expect_major_alleles,
    sum(assoc_qt_params$ped_table$snv_2b == "A")
  )
})
