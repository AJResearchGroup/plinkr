test_that("use, create_test_assoc_qt_params, PLINK text", {

  clear_plinkr_cache()

  set.seed(314)
  expect_silent(
    check_equal_number_of_snvs(
      create_test_assoc_qt_data()$data
    )
  )
  expect_silent(check_empty_plinkr_folder())
})

test_that("use, create_test_assoc_qt_params, PLINK binary data", {
  set.seed(314)
  expect_silent(
    check_equal_number_of_snvs(
      data = create_test_plink_bin_data()
    )
  )
  expect_silent(check_empty_plinkr_folder())
})

test_that("use, files, PLINK binary data", {
  set.seed(314)
  expect_silent(
    check_equal_number_of_snvs(
      data = create_plink_bin_filenames(
        bed_filename = get_plinkr_filename("demo_assoc.bed"),
        bim_filename = get_plinkr_filename("demo_assoc.bim"),
        fam_filename = get_plinkr_filename("demo_assoc.fam")
      )
    )
  )
  expect_silent(check_empty_plinkr_folder())
})

test_that("use, create_test_assoc_qt_params, PLINK2 binary data", {
  set.seed(314)
  expect_silent(
    check_equal_number_of_snvs(
      data = create_test_plink2_bin_data()
    )
  )
  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})

test_that("use, create_demo_assoc_qt_data", {
  if (!is_on_ci()) return()

  set.seed(314)
  expect_silent(
    check_equal_number_of_snvs(
      data = create_demo_assoc_qt_data()$data
    )
  )
})

test_that("detect mismatch in PLINK text data", {
  if (!is_on_ci()) return()
  if (!is_plink_installed()) return()

  clear_plinkr_cache()

  assoc_qt_data <- create_demo_assoc_qt_data()
  # Creates two SNVs
  assoc_qt_data$data$ped_table <- create_demo_ped_table(
    traits = rep(list(create_random_trait()), 2)
  )
  assoc_qt_data$data$map_table <- create_demo_map_table(
    traits = create_random_trait() # 1
  )
  expect_error(
    check_equal_number_of_snvs(
      data = assoc_qt_data$data
    ),
    "ped.*2"
  )
  expect_error(
    check_equal_number_of_snvs(
      data = assoc_qt_data$data
    ),
    "map.*1"
  )

  expect_silent(check_empty_plinkr_folder())
})

test_that("detect mismatch in PLINK bin data", {
  if (!is_on_ci()) return()
  if (!is_plink_installed()) return()

  clear_plinkr_cache()

  assoc_qt_data <- create_demo_assoc_qt_data()
  assoc_qt_data$data <- convert_plink_text_data_to_plink_bin_data(
    assoc_qt_data$data
  )
  # Remove a SNV
  assoc_qt_data$data$bim_table <- assoc_qt_data$data$bim_table[-1, ]
  expect_error(
    check_equal_number_of_snvs(
      data = assoc_qt_data$data
    ),
    "Different number of SNVs in the genotype ..bed. table"
  )
  expect_silent(check_empty_plinkr_folder())
})

test_that("detect mismatch in PLINK2 bin data", {
  if (!is_on_ci()) return()
  if (!is_plink_installed()) return()

  clear_plinkr_cache()

  assoc_qt_data <- create_demo_assoc_qt_data()
  assoc_qt_data$data <- convert_plink_text_data_to_plink2_bin_data(
    assoc_qt_data$data
  )
  # Remove a SNV
  assoc_qt_data$data$pvar_table <- assoc_qt_data$data$pvar_table[-1, ]
  expect_error(
    check_equal_number_of_snvs(
      data = assoc_qt_data$data
    ),
    "Different number of SNVs in the genetic mapping ..pvar. table"
  )
  expect_silent(check_empty_plinkr_folder())
})
