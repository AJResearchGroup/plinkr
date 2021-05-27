test_that("use", {
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_qt_params <- create_test_assoc_qt_params()
  expect_silent(
    assoc_qt(
      assoc_qt_params = assoc_qt_params
    )
  )
})

test_that("use", {
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_qt_params <- create_test_assoc_qt_params()
  assoc_qt_result <- assoc_qt(assoc_qt_params = assoc_qt_params)
  expect_true(tibble::is_tibble(assoc_qt_result))
  expect_true("CHR" %in% names(assoc_qt_result))
  expect_true("SNP" %in% names(assoc_qt_result))
  expect_true("BP" %in% names(assoc_qt_result))
  expect_true("NMISS" %in% names(assoc_qt_result))
  expect_true("BETA" %in% names(assoc_qt_result))
  expect_true("SE" %in% names(assoc_qt_result))
  expect_true("R2" %in% names(assoc_qt_result))
  expect_true("T" %in% names(assoc_qt_result))
  expect_true("P" %in% names(assoc_qt_result))
  # New: show trait name
  expect_true("trait_name" %in% names(assoc_qt_result))
  expect_true(
    all(
      assoc_qt_result$trait_name == names(assoc_qt_params$phenotype_table)[3]
    )
  )
})

test_that("default demo", {
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_qt_params <- create_demo_assoc_qt_params()
  assoc_qt_results <- assoc_qt(assoc_qt_params = assoc_qt_params)
  # Two traits times two SNPs = four association
  expect_equal(4, nrow(assoc_qt_results))
})

test_that("demo on random only", {
  if (!is_plink_installed()) return()
  assoc_qt_params <- create_demo_assoc_qt_params(
    traits = create_random_trait()
  )
  assoc_qt_results <- assoc_qt(assoc_qt_params = assoc_qt_params)
  # 1 trait times 1 SNP = 1 association
  expect_equal(nrow(assoc_qt_results), 1)
})

test_that("demo on two randoms", {
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_qt_params <- create_demo_assoc_qt_params(
    traits = rep(list(create_random_trait()), 2)
  )
  assoc_qt_results <- assoc_qt(assoc_qt_params = assoc_qt_params)
  # 2 trait times 2 SNP = 4 association
  expect_equal(nrow(assoc_qt_results), 4)
})

test_that("number of individuals", {
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_qt_params <- create_demo_assoc_qt_params(
    n_individuals = 3,
    traits = create_random_trait()
  )
  assoc_qt_results <- assoc_qt(assoc_qt_params = assoc_qt_params)
  # One traits times one SNP = one association
  expect_equal(1, nrow(assoc_qt_results))
})

test_that("demo on additive only", {
  if (!is_plink_installed()) return()
  assoc_qt_params <- create_demo_assoc_qt_params(
    traits = create_additive_trait()
  )
  assoc_qt_results <- assoc_qt(assoc_qt_params = assoc_qt_params)
  # 1 trait times 1 SNP = 1 association
  expect_equal(nrow(assoc_qt_results), 1)
})

test_that("use quantitative traits that are either 1 or 2", {
  if (!is_plink_installed()) return()
  assoc_qt_params <- create_test_assoc_qt_params()
  n_individuals <- nrow(assoc_qt_params$phenotype_table)
  assoc_qt_params$phenotype_table$case_control_code <- NULL
  assoc_qt_params$phenotype_table$special_phenotype <- sample(
    c(1, 2), size = n_individuals, replace = TRUE)
  expect_error(
    assoc_qt(
      assoc_qt_params = assoc_qt_params
    )
  )
})
