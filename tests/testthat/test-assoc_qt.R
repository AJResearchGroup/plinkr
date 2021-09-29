#
# Minimal runs
#
# Idx| PLINK version | data            | expected
# ---|---------------|-----------------|------------
#  1 | PLINK         | PLINK1 text data| OK
#  2 | PLINK         | PLINK1 bin data | OK
#  3 | PLINK         | PLINK2 bin data | Error
#  4 | PLINK2        | PLINK1 text data| Error
#  5 | PLINK2        | PLINK1 bin data | Error
#  6 | PLINK2        | PLINK2 bin data | OK
#
test_that("1. test data, PLINK1, PLINK1 text data", {
  expect_silent(check_empty_plinkr_folder())

  if (!is_plink_installed()) return()
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

test_that("2. test data, PLINK1, PLINK1 bin data", {
  expect_silent(check_empty_plinkr_folder())

  if (!is_plink_installed()) return()
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
  clear_plinkr_cache()
})

test_that("3. test data, PLINK1, PLINK2 bin data, must fail", {
  expect_silent(check_empty_plinkr_folder())

  if (!is_plink_installed()) return()
  assoc_qt_params <- create_test_assoc_qt_params(
    data = create_test_plink2_bin_data()
  )
  expect_error(
    assoc_qt(assoc_qt_params = assoc_qt_params),
    "PLINK cannot work with PLINK2 binary data"
  )
  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})

test_that("4. test data, PLINK2, PLINK1 text data, must fail", {
  expect_silent(check_empty_plinkr_folder())

  if (!is_plink_installed()) return()
  assoc_qt_params <- create_test_assoc_qt_params(
    data = create_test_plink_text_data()
  )
  expect_error(
    assoc_qt(
      assoc_qt_params = assoc_qt_params,
      plink_options = create_plink_v2_0_options()
    ),
    "PLINK2 cannot work with PLINK text data"
  )
  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})

test_that("5. test data, PLINK2, PLINK1 bin data, must fail", {
  expect_silent(check_empty_plinkr_folder())

  if (!is_plink_installed()) return()
  assoc_qt_params <- create_test_assoc_qt_params(
    data = create_test_plink_bin_data()
  )
  expect_error(
    assoc_qt(
      assoc_qt_params = assoc_qt_params,
      plink_options = create_plink_v2_0_options()
    ),
    "PLINK2 cannot work with PLINK binary data"
  )
  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})

test_that("6. test data, PLINK2, PLINK2 bin data", {
  skip("Need 'save_pgen'")
  expect_silent(check_empty_plinkr_folder())

  if (!is_plink_installed()) return()
  assoc_qt_params <- create_test_assoc_qt_params(
    data = create_test_plink2_bin_data()
  )
  assoc_qt(
    assoc_qt_params = assoc_qt_params,
    plink_options = create_plink_v2_0_options()
  )
  suppressMessages(
    expect_message(
      assoc_qt(
        assoc_qt_params = assoc_qt_params,
        plink_options = create_plink_v2_0_options(),
        verbose = TRUE
      ),
      "PLINK"
    )
  )

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})

#
# Runs with phenotypes
#
# Idx| PLINK version | data
# ---|---------------|-----------------
#  7 | PLINK         | PLINK1 text data
#  8 | PLINK         | PLINK1 bin data
#  9 | PLINK2        | PLINK2 bin data
#

test_that("test data, PLINK1, PLINK1 bin data, phenotype file", {
  if (!is_plink_installed()) return()

  # Goal is to see if the 'assoc_qt_params$phe_table' is actually used,
  # by doing an association, changing it, and doing an association again

  set.seed(314) # for runif below
  assoc_qt_params <- create_test_assoc_qt_params()
  assoc_qt_params$data <- convert_plink_text_data_to_plink_bin_data(
    assoc_qt_params$data
  )
  before <- assoc_qt(assoc_qt_params = assoc_qt_params)

  assoc_qt_params$phe_table$P1 <- runif(n = nrow(assoc_qt_params$phe_table)) # nolint PLINK naming scheme

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
  clear_plinkr_cache()
})
