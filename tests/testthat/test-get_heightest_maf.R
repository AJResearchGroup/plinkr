test_that("use", {
  expect_true(get_heighest_maf() < 0.5)
  expect_true(get_heighest_maf() > 0.49)
})
