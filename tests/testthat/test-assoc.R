test_that("minimal use, v1.7", {
  if (!is_plink_installed()) return()
  set.seed(314)
  expect_silent(
    assoc(
      assoc_params = create_test_assoc_params(),
      plink_options = create_plink_v1_7_options(),
      verbose = TRUE
    )
  )
})

test_that("minimal use, v1.9", {
  if (!is_plink_installed()) return()
  set.seed(314)
  expect_silent(
    assoc(
      assoc_params = create_test_assoc_params(),
      plink_options = create_plink_v1_9_options(),
      verbose = TRUE
    )
  )
})

test_that("minimal use v2.0", {
  skip("WIP")
  if (!is_plink_installed()) return()
  set.seed(314)
  expect_silent(
    assoc(
      create_test_assoc_params(),
      plink_options = create_plink_v2_0_options()
    )
  )
})

test_that("verbose", {
  if (!is_plink_installed()) return()
  set.seed(314)
  expect_message(
    assoc(create_test_assoc_params(), verbose = TRUE)
  )
})

test_that("confidence interval", {
  if (!is_plink_installed()) return()
  set.seed(314)
  expect_message(
    assoc(create_test_assoc_params(), verbose = TRUE),
    "--ci"
  )
})

test_that("use, test", {
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
  expect_true("L95" %in% names(assoc_result))
  expect_true("U95" %in% names(assoc_result))
})

test_that("use, demo", {
  if (!is_plink_installed()) return()
  set.seed(317)
  assoc_params <- create_demo_assoc_params()
  assoc_results <- assoc(assoc_params = assoc_params)
  # 1 traits times 1 SNP = 1 association
  expect_equal(1, nrow(assoc_results))
})

test_that("demo on random only", {
  if (!is_plink_installed()) return()
  assoc_params <- create_demo_assoc_params(
    trait = create_random_case_control_trait()
  )
  assoc_results <- assoc(assoc_params = assoc_params)
  # 1 trait times 1 SNP = 1 association
  expect_equal(nrow(assoc_results), 1)
})

test_that("number of individuals", {
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_params <- create_demo_assoc_params(
    n_individuals = 5,
    trait = create_random_case_control_trait()
  )
  assoc_results <- assoc(assoc_params = assoc_params)
  # One traits times one SNP = one association
  expect_equal(1, nrow(assoc_results))
})

test_that("error when case-controls are not 1 or 2", {
  if (!is_plink_installed()) return()
  assoc_params <- create_test_assoc_params()
  n_individuals <- nrow(assoc_params$ped_table)
  assoc_params$ped_table$case_control_code <- 314
  expect_error(
    assoc(
      assoc_params = assoc_params,
      verbose = TRUE
    )
  )
})

test_that("PLINK cannot handle triallelic SNPs", {
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_params <- create_demo_assoc_params(
    trait = create_random_case_control_trait(mafs = c(0.3, 0.2)),
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
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_params <- create_demo_assoc_params(
    trait = create_random_case_control_trait(mafs = c(0.3, 0.2, 0.1)),
    n_individuals = 10
  )
  expect_warning(
    assoc(
      assoc_params = assoc_params
    ),
    "Variant 1 quadallelic; setting rarest alleles missing"
  )
})

test_that("All chromosome numbers work", {
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_params <- create_demo_assoc_params(
    trait = create_random_case_control_trait(n_snps = 1),
    n_individuals = 10
  )
  assoc_params$map_table$CHR <- 123 # nolint PLINK coding style
  expect_silent(assoc(assoc_params = assoc_params))
})
