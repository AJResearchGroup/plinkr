test_that("use, 1 SNP", {
  expect_silent(
    read_plink_qassoc_file(
      qassoc_filename = get_plinkr_filename("assoc_qt_output_1_snp.qassoc")
    )
  )
})

test_that("use, 2 SNPs", {
  expect_silent(
    read_plink_qassoc_file(
      qassoc_filename = get_plinkr_filename("run1.qassoc")
    )
  )
})

test_that("use, 1 SNP with NAs", {
  expect_silent(
    read_plink_qassoc_file(
      qassoc_filename = get_plinkr_filename(
        "assoc_qt_output_1_snp_nas.qassoc"
      )
    )
  )
})

test_that("PLINK v1.9 .qassoc file must be readable", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_on_ci()) return()
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_qt_params <- create_demo_assoc_qt_params(
    traits = create_random_trait(n_snps = 95),
    n_individuals = 10
  )
  expect_silent(assoc_qt(assoc_qt_params = assoc_qt_params))

  expect_silent(
    read_plink_qassoc_file(
      qassoc_filename = get_plinkr_filename("assoc_qt_output_1_snp.qassoc")
    )
  )
})
