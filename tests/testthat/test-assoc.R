test_that("use", {
  if (!is_plink_installed()) return()
  set.seed(314)
  expect_silent(
    assoc(create_test_assoc_params())
  )
  expect_message(
    assoc(create_test_assoc_params(), verbose = TRUE)
  )
})

test_that("use", {
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_params <- create_test_assoc_params()
  assoc_result <- assoc(assoc_params = assoc_params)
  expect_true(tibble::is_tibble(assoc_result))
  expect_true("CHR" %in% names(assoc_result))
  expect_true("SNP" %in% names(assoc_result))
  expect_true("BP" %in% names(assoc_result))
  expect_true("A1" %in% names(assoc_result))
  expect_true("F_A" %in% names(assoc_result))
  expect_true("F_U" %in% names(assoc_result))
  expect_true("A2" %in% names(assoc_result))
  expect_true("CHISQ" %in% names(assoc_result))
  expect_true("P" %in% names(assoc_result))
  expect_true("OR" %in% names(assoc_result))
})

test_that("default demo", {
  skip("WIP")
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_params <- create_demo_assoc_params()
  assoc_results <- assoc(assoc_params = assoc_params)
  # three traits times four SNPs = 12 association
  expect_equal(12, nrow(assoc_results))
})

test_that("demo on random only", {
  skip("WIP")
  if (!is_plink_installed()) return()
  assoc_params <- create_demo_assoc_params(
    traits = create_random_trait()
  )
  assoc_results <- assoc(assoc_params = assoc_params)
  # 1 trait times 1 SNP = 1 association
  expect_equal(nrow(assoc_results), 1)
})

test_that("demo on two randoms", {
  skip("WIP")
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_params <- create_demo_assoc_params(
    traits = rep(list(create_random_trait()), 2)
  )
  assoc_results <- assoc(assoc_params = assoc_params)
  # 2 trait times 2 SNP = 4 association
  expect_equal(nrow(assoc_results), 4)
})

test_that("number of individuals", {
  skip("WIP")
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_params <- create_demo_assoc_params(
    n_individuals = 3,
    traits = create_random_trait()
  )
  assoc_results <- assoc(assoc_params = assoc_params)
  # One traits times one SNP = one association
  expect_equal(1, nrow(assoc_results))
})

test_that("demo on additive only", {
  skip("WIP")
  if (!is_plink_installed()) return()
  assoc_params <- create_demo_assoc_params(
    traits = create_additive_trait()
  )
  assoc_results <- assoc(assoc_params = assoc_params)
  # 1 trait times 1 SNP = 1 association
  expect_equal(nrow(assoc_results), 1)
})

test_that("error when case-controls are not 1 or 2", {
  skip("WIP")
  if (!is_plink_installed()) return()
  assoc_params <- create_test_assoc_params()
  n_individuals <- nrow(assoc_params$phenotype_table)
  assoc_params$phenotype_table$case_control_code <- NULL
  assoc_params$phenotype_table$special_phenotype <- sample(
    c(1, 2), size = n_individuals, replace = TRUE)
  expect_error(
    assoc(
      assoc_params = assoc_params
    )
  )
})



test_that("PLINK cannot handle triallelic SNPs", {
  skip("WIP")
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_params <- create_demo_assoc_params(
    traits = create_random_trait(mafs = c(0.3, 0.2)),
    n_individuals = 10
  )
  expect_warning(
    assoc(
      assoc_params = assoc_params
    ),
    "Variant 1 triallelic; setting rarest alleles missing."
  )
})

test_that("PLINK cannot handle quadallelic SNPs", {
  skip("WIP")
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_params <- create_demo_assoc_params(
    traits = create_random_trait(mafs = c(0.3, 0.2, 0.1)),
    n_individuals = 10
  )
  expect_warning(
    assoc(
      assoc_params = assoc_params
    ),
    "Variant 1 quadallelic; setting rarest alleles missing"
  )
})
