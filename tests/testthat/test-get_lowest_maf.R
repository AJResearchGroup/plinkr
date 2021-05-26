test_that("use", {
  expect_silent(get_lowest_maf())
  expect_true(get_lowest_maf() > 0.0)
  expect_silent(check_maf(get_lowest_maf()))
})
