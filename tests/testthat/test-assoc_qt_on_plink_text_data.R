test_that("minimal use, using PLINK1 text data", {
  clear_plinkr_cache() # nolint
  expect_silent(check_empty_plinkr_folder())

  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_qt_data <- create_test_assoc_qt_data()

  # Cannot do expect_silent, as a newline is produced
  assoc_qt_on_plink_text_data(
    assoc_qt_data = assoc_qt_data,
    assoc_qt_params = create_test_assoc_qt_params()
  )
  suppressMessages(
    expect_message(
      assoc_qt_on_plink_text_data(
        assoc_qt_data = assoc_qt_data,
        assoc_qt_params = create_test_assoc_qt_params(),
        verbose = TRUE
      ),
      "you should be able to copy paste this"
    )
  )

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache() # nolint
})

test_that("use", {
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_qt_data <- create_test_assoc_qt_data()
  assoc_qt_result <- assoc_qt_on_plink_text_data(
    assoc_qt_data = assoc_qt_data,
    assoc_qt_params = create_test_assoc_qt_params()
  )
  expect_silent(check_assoc_qt_result(assoc_qt_result))

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache() # nolint
})

test_that("default demo", {
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_qt_data <- create_demo_assoc_qt_data()

  assoc_qt_result <- assoc_qt_on_plink_text_data(
    assoc_qt_data = assoc_qt_data,
    assoc_qt_params = create_test_assoc_params()
  )
  # three traits times four SNPs = 12 association
  expect_equal(12, nrow(assoc_qt_result$qassoc_table))

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache() # nolint
})

test_that("demo on random only", {
  if (!is_plink_installed()) return()

  clear_plinkr_cache() # nolint

  assoc_qt_data <- create_demo_assoc_qt_data(
    traits = create_random_trait()
  )
  assoc_qt_result <- assoc_qt_on_plink_text_data(
    assoc_qt_data = assoc_qt_data,
    assoc_qt_params = create_test_assoc_qt_params()
  )
  # 1 trait times 1 SNP = 1 association
  expect_equal(nrow(assoc_qt_result$qassoc_table), 1)

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache() # nolint
})

test_that("demo on two randoms", {
  expect_silent(check_empty_plinkr_folder())

  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_qt_data <- create_demo_assoc_qt_data(
    traits = rep(list(create_random_trait()), 2)
  )
  assoc_qt_result <- assoc_qt_on_plink_text_data(
    assoc_qt_data = assoc_qt_data,
    assoc_qt_params = create_test_assoc_qt_params()
  )
  # 2 trait times 2 SNP = 4 association
  expect_equal(nrow(assoc_qt_result$qassoc_table), 4)

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})

test_that("number of individuals", {
  clear_plinkr_cache()
  expect_silent(check_empty_plinkr_folder())

  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_qt_data <- create_demo_assoc_qt_data(
    n_individuals = 3,
    traits = create_random_trait()
  )
  assoc_qt_result <- assoc_qt_on_plink_text_data(
    assoc_qt_data = assoc_qt_data,
    assoc_qt_params = create_test_assoc_qt_params()
  )
  # One traits times one SNP = one association
  expect_equal(1, nrow(assoc_qt_result$qassoc_table))

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache() # nolint
})

test_that("demo on additive only", {
  if (!is_plink_installed()) return()
  assoc_qt_data <- create_demo_assoc_qt_data(
    traits = create_additive_trait()
  )
  assoc_qt_result <- assoc_qt_on_plink_text_data(
    assoc_qt_data = assoc_qt_data,
    assoc_qt_params = create_test_assoc_qt_params()
  )
  expect_silent(check_assoc_qt_result(assoc_qt_result))

  # 1 trait times 1 SNP = 1 association
  expect_equal(nrow(assoc_qt_result$qassoc_table), 1)

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})

test_that("use quantitative traits that are either 1 or 2", {
  if (!is_plink_installed()) return()
  assoc_qt_data <- create_test_assoc_qt_data()
  n_individuals <- nrow(assoc_qt_data$phenotype_data$phe_table)
  assoc_qt_data$phenotype_data$phe_table$P1 <- NULL # nolint PLINK uses uppercase
  assoc_qt_data$phenotype_data$phe_table$special_phenotype <- sample(
    c(1, 2), size = n_individuals, replace = TRUE)
  expect_error(
    assoc_qt_on_plink_text_data(
      assoc_qt_data = assoc_qt_data,
      assoc_qt_params = create_test_assoc_qt_params()
    ),
    "Unknown data format"
  )

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})



test_that("PLINK cannot handle triallelic SNPs", {
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_qt_data <- create_demo_assoc_qt_data(
    traits = create_random_trait(mafs = c(0.3, 0.2)),
    n_individuals = 10
  )
  expect_warning(
    assoc_qt_on_plink_text_data(
      assoc_qt_data = assoc_qt_data,
      assoc_qt_params = create_test_assoc_qt_params()
    ),
    "Variant 1 triallelic; setting rarest alleles missing."
  )

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache() # nolint
})

test_that("PLINK cannot handle quadallelic SNPs", {
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_qt_data <- create_demo_assoc_qt_data(
    traits = create_random_trait(mafs = c(0.3, 0.2, 0.1)),
    n_individuals = 10
  )
  expect_warning(
    assoc_qt_on_plink_text_data(
      assoc_qt_data = assoc_qt_data,
      assoc_qt_params = create_test_assoc_qt_params()
    ),
    "Variant 1 quadallelic; setting rarest alleles missing"
  )

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache() # nolint
})

test_that("95 chromosome numbers work", {
  expect_silent(check_empty_plinkr_folder())

  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_qt_data <- create_demo_assoc_qt_data(
    traits = create_random_trait(n_snps = 95),
    n_individuals = 10
  )
  assoc_qt_on_plink_text_data(
    assoc_qt_data = assoc_qt_data,
    assoc_qt_params = create_test_assoc_qt_params()
  )

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache() # nolint
})

test_that("use incorrect data", {

  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_qt_data <- create_test_assoc_qt_data()
  assoc_qt_data$data <- convert_plink_text_data_to_plink_bin_data(
    assoc_qt_data$data
  )
  expect_false(is_plink_text_data(assoc_qt_data$data))
  expect_error(
    assoc_qt_on_plink_text_data(
      assoc_qt_data = assoc_qt_data,
      assoc_qt_params = create_test_assoc_qt_params()
    ),
    "is not PLINK text data"
  )
  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})
