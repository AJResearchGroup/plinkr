test_that("use", {
  expect_silent(
    read_plink_assoc_adjusted_file(
      assoc_adjusted_filename = get_plinkr_filename("assoc.assoc.adjusted")
    )
  )
})
