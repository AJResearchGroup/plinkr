test_that("use", {
  expect_true(is_bed_table(get_test_bed_table()))
  expect_false(is_bed_table("nonsense"))
  expect_message(is_bed_table("nonsense", verbose = TRUE))
})
