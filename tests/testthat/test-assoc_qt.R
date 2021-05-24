test_that("use", {
  if (!is_plink_installed()) return()
  assoc_qt_params <- get_test_assoc_qt_params()
  expect_silent(
    assoc_qt(
      assoc_qt_params = assoc_qt_params
    )
  )
})

test_that("use", {
  if (!is_plink_installed()) return()
  assoc_qt_params <- get_test_assoc_qt_params()
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
