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
