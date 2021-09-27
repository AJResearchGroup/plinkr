test_that("detailed use", {
  assoc_table <- read_plink_assoc_file(
    assoc_filename = get_plinkr_filename("run1.assoc")
  )
  expect_silent(check_assoc_table(assoc_table))
})
