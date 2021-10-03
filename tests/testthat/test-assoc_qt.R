#
# Minimal runs on data
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
  clear_plinkr_cache()

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
      "you should be able to copy paste this"
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
      "you should be able to copy paste this"
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
  expect_silent(check_empty_plinkr_folder())

  if (!is_plink_installed()) return()
  assoc_qt_params <- create_test_assoc_qt_params(
    data = create_test_plink2_bin_data()
  )
  expect_warning(

    assoc_qt(
      assoc_qt_params = assoc_qt_params,
      plink_options = create_plink_v2_0_options()
    ),
    "--glm remaining control count is less than 10x predictor count for"
  )
  suppressWarnings(
    suppressMessages(
      expect_message(
        assoc_qt(
          assoc_qt_params = assoc_qt_params,
          plink_options = create_plink_v2_0_options(),
          verbose = TRUE
        ),
        "you should be able to copy paste this"
      )
    )
  )
  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})

#
# Minimal runs on filenames
#
# Idx| PLINK version | filenames            | expected
# ---|---------------|----------------------|------------
#  7 | PLINK         | PLINK1 text filenames| OK
#  8 | PLINK         | PLINK1 bin filenames | OK
#  9 | PLINK         | PLINK2 bin filenames | Error
# 10 | PLINK2        | PLINK1 text filenames| Error
# 11 | PLINK2        | PLINK1 bin filenames | Error
# 12 | PLINK2        | PLINK2 bin filenames | OK
#
test_that("7. test filenames, PLINK1, PLINK1 text filenames", {
  expect_silent(check_empty_plinkr_folder())

  skip("assoc_qt 7")
  if (!is_plink_installed()) return()
  assoc_qt_params <- create_test_assoc_qt_params(
    data = create_test_plink_text_data()
  )
  assoc_qt_params$data <- save_plink_text_data(assoc_qt_params$data)
  save_phe_table(
    phe_table = assoc_qt_params$phe_table,
    phe_filename = paste0(assoc_qt_params$base_input_filename, ".phe")
  )

  assoc_qt(assoc_qt_params = assoc_qt_params)
  suppressMessages(
    expect_message(
      assoc_qt(
        assoc_qt_params = assoc_qt_params,
        verbose = TRUE
      ),
      "you should be able to copy paste this"
    )
  )

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})

test_that("8. test filenames, PLINK1, PLINK1 bin filenames", {
  skip("assoc_qt 8")
  expect_silent(check_empty_plinkr_folder())

  if (!is_plink_installed()) return()
  assoc_qt_params <- create_test_assoc_qt_params(
    data = create_test_plink_bin_data()
  )
  assoc_qt_params$data <- save_plink_bin_data(assoc_qt_params$data)
  save_phe_table(
    phe_table = assoc_qt_params$phe_table,
    phe_filename = paste0(assoc_qt_params$base_input_filename, ".phe")
  )

  assoc_qt(assoc_qt_params = assoc_qt_params)
  suppressMessages(
    expect_message(
      assoc_qt(
        assoc_qt_params = assoc_qt_params,
        verbose = TRUE
      ),
      "you should be able to copy paste this"
    )
  )

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})

test_that("9. test filenames, PLINK1, PLINK2 bin filenames, must fail", {
  skip("assoc_qt 9")
  expect_silent(check_empty_plinkr_folder())

  if (!is_plink_installed()) return()
  assoc_qt_params <- create_test_assoc_qt_params(
    filenames = create_test_plink2_bin_filenames()
  )
  expect_error(
    assoc_qt(assoc_qt_params = assoc_qt_params),
    "PLINK cannot work with PLINK2 binary filenames"
  )
  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})

test_that("10. test filenames, PLINK2, PLINK1 text filenames, must fail", {
  skip("assoc_qt 10")
  expect_silent(check_empty_plinkr_folder())

  if (!is_plink_installed()) return()
  assoc_qt_params <- create_test_assoc_qt_params(
    filenames = create_test_plink_text_filenames()
  )
  expect_error(
    assoc_qt(
      assoc_qt_params = assoc_qt_params,
      plink_options = create_plink_v2_0_options()
    ),
    "PLINK2 cannot work with PLINK text filenames"
  )
  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})

test_that("11. test filenames, PLINK2, PLINK1 bin filenames, must fail", {
  skip("assoc_qt 11")
  expect_silent(check_empty_plinkr_folder())

  if (!is_plink_installed()) return()
  assoc_qt_params <- create_test_assoc_qt_params(
    filenames = create_test_plink_bin_filenames()
  )
  expect_error(
    assoc_qt(
      assoc_qt_params = assoc_qt_params,
      plink_options = create_plink_v2_0_options()
    ),
    "PLINK2 cannot work with PLINK binary filenames"
  )
  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})

test_that("12. test filenames, PLINK2, PLINK2 bin filenames", {

  skip("Does not clean up well yet")
  expect_silent(check_empty_plinkr_folder())

  if (!is_plink_installed()) return()
  assoc_qt_params <- create_test_assoc_qt_params(
    data = create_test_plink2_bin_data()
  )
  assoc_qt_params$data <- save_plink2_bin_data(assoc_qt_params$data)
  save_phe_table(
    phe_table = assoc_qt_params$phe_table,
    phe_filename = paste0(assoc_qt_params$base_input_filename, ".phe")
  )

  expect_warning(
    assoc_qt_results_filenames <- assoc_qt(
      assoc_qt_params = assoc_qt_params,
      plink_options = create_plink_v2_0_options()
    ),
    "--glm remaining control count is less than 10x predictor count for"
  )
  suppressWarnings(
    suppressMessages(
      expect_message(
        assoc_qt(
          assoc_qt_params = assoc_qt_params,
          plink_options = create_plink_v2_0_options(),
          verbose = TRUE
        ),
        "you should be able to copy paste this"
      )
    )
  )
  file.remove(assoc_qt_params$data$pgen_filename)
  file.remove(assoc_qt_params$data$psam_filename)
  file.remove(assoc_qt_params$data$pvar_filename)
  file.remove(assoc_qt_results_filenames)
  unlink(dirname(assoc_qt_params$base_input_filename), recursive = TRUE)
  unlink(dirname(assoc_qt_params$base_output_filename), recursive = TRUE)

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})

#
# Runs with phenotypes
#
# Idx| PLINK version | data
# ---|---------------|-----------------
# 13 | PLINK         | PLINK1 text data
# 14 | PLINK         | PLINK1 bin data
# 15 | PLINK2        | PLINK2 bin data
#

test_that("13. test data, PLINK1, PLINK1 bin data, phenotype file", {
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

test_that("Compare assoc_qt results and speed of PLINKs", {
  expect_equal(1 + 1, 2) # To prevent 'No test' warning
  return()
  if (!is_plink_installed()) return()

  # Goal is to see the results of the PLINK versions
  set.seed(314)
  assoc_qt_params <- create_demo_assoc_qt_params(
    n_individuals = 1000,
    traits = create_random_trait(n_snps = 1000)
  )
  assoc_qt_params$data$map_table$CHR <- 1 # nolint PLINK2 variable naming

  # Convert the data
  plink_text_data <- assoc_qt_params$data
  plink_bin_data <- convert_plink_text_data_to_plink_bin_data(
    assoc_qt_params$data
  )
  plink2_bin_data <- convert_plink_text_data_to_plink2_bin_data(
    assoc_qt_params$data
  )
  expect_silent(check_plink_text_data(plink_text_data))
  expect_silent(check_plink_bin_data(plink_bin_data))
  expect_silent(check_plink2_bin_data(plink2_bin_data))

  # Save the data
  plink_text_filenames <- save_plink_text_data(plink_text_data)
  plink_bin_filenames <- save_plink_bin_data(plink_bin_data)
  plink2_bin_filenames <- save_plink2_bin_data(plink2_bin_data)
  save_phe_table(
    assoc_qt_params$phe_table,
    phe_filename = paste0(assoc_qt_params$base_input_filename, ".phe")
  )
  expect_silent(check_plink_text_filenames(plink_text_filenames))
  expect_silent(check_plink_bin_filenames(plink_bin_filenames))
  expect_silent(check_plink2_bin_filenames(plink2_bin_filenames))


  # PLINK v1.9 with text files
  assoc_qt_params$data <- plink_text_filenames
  expect_true(is_plink_text_filenames(assoc_qt_params$data))
  start_plink_text_time <- Sys.time()
  assoc_qt_result_plink_text <- assoc_qt(
    assoc_qt_params = assoc_qt_params,
    plink_options = create_plink_v1_9_options()
  )
  end_plink_text_time <- Sys.time()
  # PLINK v1.9 with bin files
  assoc_qt_params$data <- plink_bin_filenames
  expect_true(is_plink_bin_filenames(assoc_qt_params$data))
  start_plink_bin_time <- Sys.time()
  assoc_qt_result_plink_bin <- assoc_qt(
    assoc_qt_params = assoc_qt_params,
    plink_options = create_plink_v1_9_options()
  )
  end_plink_bin_time <- Sys.time()
  # PLINK v2.0 with PLINK2 binary files
  assoc_qt_params$data <- plink2_bin_filenames
  expect_true(is_plink2_bin_filenames(assoc_qt_params$data))
  start_plink2_bin_time <- Sys.time()
  assoc_qt_result_plink2_bin <- assoc_qt(
    assoc_qt_params = assoc_qt_params,
    plink_options = create_plink_v2_0_options()
  )
  end_plink2_bin_time <- Sys.time()

  # View the resulting associations found
  assoc_qt_result_plink_text
  assoc_qt_result_plink_bin
  assoc_qt_result_plink2_bin

  # View the times it took
  dt_plink_text <- end_plink_text_time - start_plink_text_time
  dt_plink_bin <- end_plink_bin_time - start_plink_bin_time
  dt_plink2_bin <- end_plink2_bin_time - start_plink2_bin_time
  dt_plink_text
  dt_plink_bin
  dt_plink2_bin
  # Note that this comparison is unfair, as when assoc_qt
  # is called, the files need to be created

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})
