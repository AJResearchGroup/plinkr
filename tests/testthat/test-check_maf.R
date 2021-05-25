test_that("use", {
  expect_silent(check_maf(0.3))
  expect_error(check_maf(0.6))
  expect_error(check_maf(-0.3))
  expect_error(check_maf("nonsense"))
  expect_error(check_maf(12))
  expect_error(check_maf(NULL))
  expect_error(check_maf(NA))
})
