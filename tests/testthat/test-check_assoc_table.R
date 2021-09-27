test_that("detailed use", {
  skip("No 'check_assoc_table' yet")
  assoc_table <- read_plink_assoc_file(
    assoc_filename = get_plinkr_filename("run1.assoc")
  )
  expect_silent(check_assoc_table(assoc_table))
})
