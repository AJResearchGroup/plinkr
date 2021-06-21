test_that("use", {
  assoc_qt_params <- create_demo_assoc_qt_params()
  expect_silent(check_assoc_qt_params(assoc_qt_params))
})

test_that("n_individuals", {
  n_individuals <- 5
  assoc_qt_params <- create_demo_assoc_qt_params(
    n_individuals = n_individuals
  )
  expect_silent(check_assoc_qt_params(assoc_qt_params))
  expect_equal(n_individuals, nrow(assoc_qt_params$ped_table))
  expect_equal(n_individuals, nrow(assoc_qt_params$phe_table))
})

test_that("MAFs", {
  n_individuals <- 10
  mafs <- c(0.2, 0.1)
  assoc_qt_params <- create_demo_assoc_qt_params(
    traits = list(
      create_random_trait(maf = mafs[1]),
      create_random_trait(maf = mafs[2])
    ),
    n_individuals = n_individuals
  )
  expect_silent(check_assoc_qt_params(assoc_qt_params))
  expect_equal(n_individuals, nrow(assoc_qt_params$ped_table))
  expect_equal(n_individuals, nrow(assoc_qt_params$phe_table))
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

test_that("one random, 1 SNP", {
  expect_silent(
    create_demo_assoc_qt_params(
      traits = create_random_trait()
    )
  )
})

test_that("one random, 2 SNPs", {
  expect_silent(
    create_demo_assoc_qt_params(
      traits = create_random_trait(n_snps = 2)
    )
  )
})

test_that("one additive, 1 SNP", {
  expect_silent(
    create_demo_assoc_qt_params(
      traits = create_additive_trait()
    )
  )
})

test_that("one additive, 2 SNPs", {
  expect_silent(
    create_demo_assoc_qt_params(
      traits = create_additive_trait(n_snps = 2)
    )
  )
})

test_that("one epistatic, 1 SNP", {
  expect_silent(
    create_demo_assoc_qt_params(
      traits = create_epistatic_trait()
    )
  )
})

test_that("one epistatic, 3 SNPs", {
  expect_silent(
    create_demo_assoc_qt_params(
      traits = create_epistatic_trait(n_snps = 3),
      n_individuals = 64
    )
  )
})

test_that("number of individuals", {
  expect_silent(
    create_demo_assoc_qt_params(
      n_individuals = 3,
      traits = create_random_trait()
    )
  )
})

test_that("Triallelic SNPs", {
  expect_silent(
    create_demo_assoc_qt_params(
      traits = create_random_trait(mafs = c(0.3, 0.2)),
      n_individuals = 10
    )
  )
})

test_that("Quadallelic SNPs", {
  expect_silent(
    create_demo_assoc_qt_params(
      traits = create_random_trait(mafs = c(0.3, 0.2, 0.1)),
      n_individuals = 10
    )
  )
})

test_that("two randoms", {
  expect_silent(
    create_demo_assoc_qt_params(
      traits = rep(list(create_random_trait()), 2)
    )
  )
})

test_that("two additive", {
  expect_silent(
    create_demo_assoc_qt_params(
      traits = rep(list(create_additive_trait()), 2)
    )
  )
})

test_that("two epistatic", {
  expect_silent(
    create_demo_assoc_qt_params(
      traits = rep(list(create_additive_trait()), 2)
    )
  )
})

test_that("two of demo traits", {
  expect_silent(
    create_demo_assoc_qt_params(
      traits = rep(create_demo_traits(), 2)
    )
  )
})
