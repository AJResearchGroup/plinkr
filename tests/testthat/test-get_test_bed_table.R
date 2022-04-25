test_that("use", {
  expect_silent(get_test_bed_table())
  expect_silent(get_test_bed_table(n_snps = 3))
  check_bed_table(get_test_bed_table())
})
