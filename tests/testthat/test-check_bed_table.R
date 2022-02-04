test_that("use", {
  expect_silent(check_bed_table(get_test_bed_table()))
})

test_that("abuse", {
  good_bed_table <- get_test_bed_table()
  expect_silent(check_bed_table(good_bed_table))

  # Change class names
  bed_table <- good_bed_table
  class(bed_table) <- "data.frame"
  expect_error(
    check_bed_table(bed_table),
    "'bed_table' does not have class types 'c\\(\"matrix\", \"array\"\\)', nor '\"matrix\"'" # nolint indeed long, but I did not want to use 'paste' here
  )
  # Change class names to either 'array' or 'matrix', which is impossible
  if (1 == 2) {
    bed_table <- good_bed_table
    class(bed_table) <- "matrix"
    check_bed_table(bed_table)

    bed_table <- good_bed_table
    class(bed_table) <- "array"
    check_bed_table(bed_table)
  }

})
