test_that("use", {
  expect_silent(check_empty_plinkr_folder())
  if (!is_plink_installed()) return()
  assoc_qt_params <- create_test_assoc_qt_params()
  expect_silent(
    assoc_qt_nth_trait(
      assoc_qt_params = assoc_qt_params,
      n = 1
    )
  )
  expect_error(
    assoc_qt_nth_trait(
      assoc_qt_params = assoc_qt_params,
      n = 2
    ),
    "Cannot associate the nth trait, as it is absent"
  )

  suppressMessages(
    expect_message(
      assoc_qt_nth_trait(
        assoc_qt_params = assoc_qt_params,
        n = 1,
        verbose = TRUE
      ),
    )
  )

  expect_silent(check_empty_plinkr_folder())
})

test_that("for one trait, must match assoc_qt", {
  if (!is_plink_installed()) return()
  assoc_qt_params <- create_test_assoc_qt_params()
  assoc_qt_result_all <- assoc_qt(assoc_qt_params = assoc_qt_params)
  assoc_qt_result_nth <- assoc_qt_nth_trait(
    assoc_qt_params = assoc_qt_params,
    n = 1
  )
  expect_identical(assoc_qt_result_all$qassoc_table, assoc_qt_result_nth)

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})

test_that("for two trait, must match assoc_qt", {
  if (!is_plink_installed()) return()
  assoc_qt_params <- create_test_assoc_qt_params()
  assoc_qt_params$phe_table$trait_y <-
    seq_len(nrow(assoc_qt_params$phe_table)) ^ 2

  assoc_qt_result_all <- assoc_qt(assoc_qt_params = assoc_qt_params)
  assoc_qt_result_1 <- assoc_qt_nth_trait(
    assoc_qt_params = assoc_qt_params,
    n = 1
  )
  assoc_qt_result_2 <- assoc_qt_nth_trait(
    assoc_qt_params = assoc_qt_params,
    n = 2
  )
  expect_false(identical(assoc_qt_result_1, assoc_qt_result_2))
  expect_identical(
    assoc_qt_result_all$qassoc_table[c(1, 2), ],
    assoc_qt_result_1
  )
  expect_identical(
    assoc_qt_result_all$qassoc_table[c(3, 4), ],
    assoc_qt_result_2
  )

  expect_silent(check_empty_plinkr_folder())
})
