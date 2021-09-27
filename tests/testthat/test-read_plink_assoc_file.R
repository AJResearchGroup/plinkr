test_that("minimal use", {
  expect_silent(
    read_plink_assoc_file(
      assoc_filename = get_plinkr_filename("run1.assoc")
    )
  )
})
