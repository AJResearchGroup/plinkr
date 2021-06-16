test_that("use", {
  expect_silent(
    check_qassoc_table(
      qassoc_table = read_plink_qassoc_file(
        get_plinkr_filename("assoc_qt_output_1_snp.qassoc")
      )
    )
  )
  expect_error(check_qassoc_table("nonsense"))
})
