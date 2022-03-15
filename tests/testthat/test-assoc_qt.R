test_that("Use uniform interface", {

  if (!is_plink_installed()) return()

  clear_plinkr_cache()

  assoc_qt_data <- create_test_assoc_qt_data()
  assoc_qt(assoc_qt_data = assoc_qt_data)
  suppressMessages(
    expect_message(
      assoc_qt(
        assoc_qt_data = assoc_qt_data,
        verbose = TRUE
      ),
      "you should be able to copy paste this"
    )
  )

  expect_silent(check_empty_plinkr_folder())
})

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
  if (!is_plink_installed()) return()

  clear_plinkr_cache()

  assoc_qt_data <- create_test_assoc_qt_data(
    data = create_test_plink_text_data()
  )
  assoc_qt(
    assoc_qt_data = assoc_qt_data
  )
  suppressMessages(
    expect_message(
      assoc_qt(
        assoc_qt_data = assoc_qt_data,
        verbose = TRUE
      ),
      "you should be able to copy paste this"
    )
  )

  expect_silent(check_empty_plinkr_folder())
})

test_that("2. test data, PLINK1, PLINK1 bin data", {

  if (!is_plink_installed()) return()

  clear_plinkr_cache()

  assoc_qt_data <- create_test_assoc_qt_data(
    data = create_test_plink_bin_data()
  )
  assoc_qt(
    assoc_qt_data = assoc_qt_data
  )
  suppressMessages(
    expect_message(
      assoc_qt(
        assoc_qt_data = assoc_qt_data,
        verbose = TRUE
      ),
      "you should be able to copy paste this"
    )
  )

  expect_silent(check_empty_plinkr_folder())
})

test_that("3. test data, PLINK1, PLINK2 bin data, must fail", {

  if (!is_plink_installed()) return()

  clear_plinkr_cache()

  assoc_qt_data <- create_test_assoc_qt_data(
    data = create_test_plink2_bin_data()
  )
  expect_error(
    assoc_qt(
      assoc_qt_data = assoc_qt_data
    ),
    "PLINK cannot work with PLINK2 binary data"
  )
  expect_silent(check_empty_plinkr_folder())
})

test_that("4. test data, PLINK2, PLINK1 text data, must fail", {

  if (!is_plink_installed()) return()

  clear_plinkr_cache()

  assoc_qt_data <- create_test_assoc_qt_data(
    data = create_test_plink_text_data()
  )
  expect_error(
    assoc_qt(
      assoc_qt_data = assoc_qt_data,
      plink_options = create_plink_v2_0_options()
    ),
    "PLINK2 cannot work with PLINK text data"
  )
  expect_silent(check_empty_plinkr_folder())
})

test_that("5. test data, PLINK2, PLINK1 bin data, must fail", {

  if (!is_plink_installed()) return()

  clear_plinkr_cache()

  assoc_qt_data <- create_test_assoc_qt_data(
    data = create_test_plink_bin_data()
  )
  expect_error(
    assoc_qt(
      assoc_qt_data = assoc_qt_data,
      plink_options = create_plink_v2_0_options()
    ),
    "PLINK2 cannot work with PLINK binary data"
  )
  expect_silent(check_empty_plinkr_folder())
})

test_that("6. test data, PLINK2, PLINK2 bin data", {

  if (!is_plink_installed()) return()

  clear_plinkr_cache()

  assoc_qt_data <- create_test_assoc_qt_data(
    data = create_test_plink2_bin_data()
  )
  expect_warning(
    assoc_qt(
      assoc_qt_data = assoc_qt_data,
      plink_options = create_plink_v2_0_options()
    ),
    "--glm remaining control count is less than 10x predictor count for"
  )
  suppressWarnings(
    suppressMessages(
      expect_message(
        assoc_qt(
          assoc_qt_data = assoc_qt_data,
          plink_options = create_plink_v2_0_options(),
          verbose = TRUE
        ),
        "you should be able to copy paste this"
      )
    )
  )
  expect_silent(check_empty_plinkr_folder())
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
  if (!is_plink_installed()) return()

  clear_plinkr_cache()

  assoc_qt_data <- create_test_assoc_qt_data(
    data = create_test_plink_text_data()
  )
  assoc_qt_params <- create_test_assoc_qt_params()
  assoc_qt_data$data <- save_plink_text_data(
    plink_text_data = assoc_qt_data$data,
    base_input_filename = assoc_qt_params$base_input_filename
  )
  assoc_qt_data$phenotype_data <- save_phenotype_data_table(
    phenotype_data_table = assoc_qt_data$phenotype_data,
    phe_filename = paste0(assoc_qt_params$base_input_filename, ".phe")
  )
  check_assoc_qt_data(assoc_qt_data)

  assoc_qt_result_filenames <- assoc_qt(
    assoc_qt_data = assoc_qt_data,
    assoc_qt_params = assoc_qt_params
  )
  file.remove(assoc_qt_result_filenames$qassoc_filenames)
  file.remove(assoc_qt_result_filenames$log_filename)

  suppressMessages(
    expect_message(
      assoc_qt_result_filenames <- assoc_qt(
        assoc_qt_data = assoc_qt_data,
        assoc_qt_params = assoc_qt_params,
        verbose = TRUE
      ),
      "you should be able to copy paste this"
    )
  )

  file.remove(assoc_qt_result_filenames$qassoc_filenames)
  file.remove(assoc_qt_result_filenames$log_filename)
  unlink(dirname(assoc_qt_data$phenotype_data$phe_filename), recursive = TRUE)
  unlink(dirname(assoc_qt_params$base_input_filename), recursive = TRUE)
  unlink(dirname(assoc_qt_params$base_output_filename), recursive = TRUE)

  expect_silent(check_empty_plinkr_folder())
})

test_that("8. test filenames, PLINK1, PLINK1 bin filenames", {
  skip("assoc_qt 8: leaves file")

  if (!is_plink_installed()) return()

  clear_plinkr_cache()

  assoc_qt_data <- create_test_assoc_qt_data(
    data = create_test_plink_bin_data()
  )
  assoc_qt_data$data <- save_plink_bin_data(assoc_qt_data$data)
  assoc_qt_params <- create_test_assoc_qt_params()
  save_phe_table(
    phe_table = assoc_qt_data$phenotype_data$phe_table,
    phe_filename = paste0(assoc_qt_params$base_input_filename, ".phe")
  )

  assoc_qt(
    assoc_qt_data = assoc_qt_data,
    assoc_qt_params = assoc_qt_params
  )
  suppressMessages(
    expect_message(
      assoc_qt(
        assoc_qt_data = assoc_qt_data,
        assoc_qt_params = assoc_qt_params,
        verbose = TRUE
      ),
      "you should be able to copy paste this"
    )
  )
  unlink(dirname(assoc_qt_params$base_output_filename), recursive = TRUE)
  unlink(dirname(assoc_qt_params$base_input_filename), recursive = TRUE)

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})

test_that("9. test filenames, PLINK1, PLINK2 bin filenames, must fail", {

  skip("assoc_qt 9")

  if (!is_plink_installed()) return()

  clear_plinkr_cache()

  assoc_qt_data <- create_test_assoc_qt_data(
    data = create_test_plink2_bin_filenames()
  )
  expect_error(
    assoc_qt(
      assoc_qt_data = assoc_qt_data,
      plink_options = create_plink_v1_7_options()
    ),
    "PLINK cannot work with PLINK2 binary filenames"
  )
  expect_silent(check_empty_plinkr_folder())
})

test_that("10. test filenames, PLINK2, PLINK1 text filenames, must fail", {

  if (!is_plink_installed()) return()

  clear_plinkr_cache()

  assoc_qt_data <- create_test_assoc_qt_data(
    data = create_test_plink_text_filenames(),
    phenotype_data = create_test_phenotype_data_table()
  )
  expect_error(
    assoc_qt(
      assoc_qt_data = assoc_qt_data,
      plink_options = create_plink_v2_0_options()
    ),
    "PLINK2 cannot work with PLINK text files"
  )
  expect_silent(check_empty_plinkr_folder())
})

test_that("11. test filenames, PLINK2, PLINK1 bin filenames, must fail", {

  skip("assoc_qt 11")

  if (!is_plink_installed()) return()

  clear_plinkr_cache()

  assoc_qt_data <- create_test_assoc_qt_data(
    data = create_test_plink_bin_filenames(),
    phenotype_data = create_test_phenotype_data_table()
  )
  expect_error(
    assoc_qt_results_filenames <- assoc_qt(
      assoc_qt_data = assoc_qt_data,
      plink_options = create_plink_v2_0_options()
    ),
    "PLINK2 cannot work with PLINK binary files"
  )
  expect_silent(check_empty_plinkr_folder())
})

test_that("12. test filenames, PLINK2, PLINK2 bin filenames", {

  skip("Does not clean up well yet")

  if (!is_plink_installed()) return()

  clear_plinkr_cache()

  assoc_qt_data <- create_test_assoc_qt_data(
    data = create_test_plink2_bin_data()
  )
  assoc_qt_params <- create_test_assoc_qt_params()
  assoc_qt_data$data <- save_plink2_bin_data(assoc_qt_data$data)
  save_phe_table(
    phe_table = assoc_qt_data$phenotype_data$phe_table,
    phe_filename = paste0(assoc_qt_params$base_input_filename, ".phe")
  )

  expect_warning(
    assoc_qt_results_filenames <- assoc_qt(
      assoc_qt_data = assoc_qt_data,
      plink_options = create_plink_v2_0_options()
    ),
    "--glm remaining control count is less than 10x predictor count for"
  )
  suppressWarnings(
    suppressMessages(
      expect_message(
        assoc_qt(
          assoc_qt_data = assoc_qt_data,
          plink_options = create_plink_v2_0_options(),
          verbose = TRUE
        ),
        "you should be able to copy paste this"
      )
    )
  )
  file.remove(assoc_qt_data$data$pgen_filename)
  file.remove(assoc_qt_data$data$psam_filename)
  file.remove(assoc_qt_data$data$pvar_filename)
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

  clear_plinkr_cache()

  # Goal is to see if the 'assoc_qt_params$phe_table' is actually used,
  # by doing an association, changing it, and doing an association again

  set.seed(314) # for runif below
  assoc_qt_data <- create_test_assoc_qt_data()
  assoc_qt_data$data <- convert_plink_text_data_to_plink_bin_data(
    assoc_qt_data$data
  )
  assoc_qt_params <- create_test_assoc_qt_params()
  before <- assoc_qt(
    assoc_qt_data = assoc_qt_data,
    assoc_qt_params = assoc_qt_params
  )

  assoc_qt_data$phenotype_data$phe_table$P1 <- runif( # nolint PLINK naming scheme
    n = nrow(assoc_qt_data$phenotype_data$phe_table)
  )

  after <- assoc_qt(
    assoc_qt_data = assoc_qt_data,
    assoc_qt_params = assoc_qt_params
  )
  expect_equal(before$CHR, after$CHR) # nolint PLINK naming scheme
  expect_equal(before$BP, after$BP) # nolint PLINK naming scheme
  expect_equal(before$NMISS, after$NMISS) # nolint PLINK naming scheme
  expect_true(all(before$BETA != after$BETA)) # nolint PLINK naming scheme
  expect_true(all(before$SE != after$SE)) # nolint PLINK naming scheme
  expect_true(all(before$R2 != after$R2)) # nolint PLINK naming scheme
  expect_true(all(before$T != after$T)) # nolint PLINK naming scheme
  expect_true(all(before$P != after$P)) # nolint PLINK naming scheme

  expect_silent(check_empty_plinkr_folder())
})

test_that("Compare assoc_qt results and speed of PLINKs", {
  expect_equal(1 + 1, 2) # To prevent 'No test' warning
  return()
  if (!is_plink_installed()) return()

  clear_plinkr_cache()

  # Goal is to see the results of the PLINK versions
  set.seed(314)
  assoc_qt_params <- create_demo_assoc_qt_data(
    n_individuals = 1000,
    traits = rep(list(create_random_trait(n_snps = 10)), times = 100)
  )
  assoc_qt_data$data$map_table$CHR <- 1 # nolint PLINK2 variable naming

  # Convert the data
  plink_text_data <- assoc_qt_data$data
  plink_bin_data <- convert_plink_text_data_to_plink_bin_data(
    assoc_qt_data$data
  )
  plink2_bin_data <- convert_plink_text_data_to_plink2_bin_data(
    assoc_qt_data$data
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

  datas <- list(plink_text_filenames, plink_bin_filenames, plink2_bin_filenames)
  plink_optionses <- create_plink_optionses()
  times <- tidyr::expand_grid(
    data = datas,
    data_type = NA,
    plink_options = plink_optionses,
    plink_version = NA,
    time_sec = NA
  )
  for (i in seq_len(nrow(times))) {
    message(i)
    times$data_type[i] <- names(times$data[[i]])[1]
    times$plink_version[i] <- times$plink_options[[i]]$plink_version
    if (
      can_plink_version_and_data_can_work_together(
        data = times$data[[i]],
        plink_options = times$plink_options[[i]]
      )
    ) {
      assoc_qt_data$data <- times$data[[i]]
      start_time <- Sys.time()
      assoc_qt_result_plink_text <- assoc_qt(
        assoc_qt_params = assoc_qt_params,
        plink_options = times$plink_options[[i]]
      )
      end_time <- Sys.time()
      times$time_sec[i] <- end_time - start_time
    }
  }
  times

  expect_silent(check_empty_plinkr_folder())
})
