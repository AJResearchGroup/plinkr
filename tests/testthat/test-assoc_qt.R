test_that("minimal use, using PLINK1 text data", {
  expect_silent(check_empty_plinkr_folder())

  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_qt_params <- create_test_assoc_qt_params(
    data = create_test_plink_text_data()
  )
  assoc_qt(assoc_qt_params = assoc_qt_params)
  suppressMessages(
    expect_message(
      assoc_qt(
        assoc_qt_params = assoc_qt_params,
        verbose = TRUE
      ),
      "PLINK"
    )
  )

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})

test_that("minimal use, using PLINK1 binary data", {
  skip("Coersions")
  expect_silent(check_empty_plinkr_folder())

  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_qt_params <- create_test_assoc_qt_params(
    data = create_test_plink_bin_data()
  )
  assoc_qt(assoc_qt_params = assoc_qt_params)
  suppressMessages(
    expect_message(
      assoc_qt(
        assoc_qt_params = assoc_qt_params,
        verbose = TRUE
      ),
      "PLINK"
    )
  )

  expect_silent(check_empty_plinkr_folder())
})


test_that("minimal use, using PLINK1 binary data", {
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_qt_params <- create_test_assoc_qt_params()
  assoc_qt_params$data <- convert_plink_text_data_to_plink_bin_data(
    assoc_qt_params$data
  )
  assoc_qt(assoc_qt_params = assoc_qt_params)
  suppressMessages(
    expect_message(
      assoc_qt(
        assoc_qt_params = assoc_qt_params,
        verbose = TRUE
      ),
      "PLINK"
    )
  )

  expect_silent(check_empty_plinkr_folder())
})

test_that("minimal use, using PLINK1 binary data and a phenotype file", {
  if (!is_plink_installed()) return()

  # Goal is to see if the 'assoc_qt_params$phe_table' is actually used,
  # by doing an association, changing it, and doing an association again

  set.seed(314)
  assoc_qt_params <- create_test_assoc_qt_params()
  assoc_qt_params$data <- convert_plink_text_data_to_plink_bin_data(
    assoc_qt_params$data
  )
  before <- assoc_qt(assoc_qt_params = assoc_qt_params)

  assoc_qt_params$phe_table$P1 <- runif(n = nrow(assoc_qt_params$phe_table))

  after <- assoc_qt(assoc_qt_params = assoc_qt_params)
  expect_equal(before$CHR, after$CHR)
  expect_equal(before$BP, after$BP)
  expect_equal(before$NMISS, after$NMISS)
  expect_true(all(before$BETA != after$BETA))
  expect_true(all(before$SE != after$SE))
  expect_true(all(before$R2 != after$R2))
  expect_true(all(before$T != after$T))
  expect_true(all(before$P != after$P))

  expect_silent(check_empty_plinkr_folder())
})
