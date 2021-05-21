test_that("use", {
  expect_silent(
    read_plink_qassoc_file(
      qassoc_filename = get_plinkr_filename("run1.qassoc")
    )
  )
})
