test_that("use", {
  expect_silent(create_plink_options())
  expect_silent(create_plink_v1_7_options())
  expect_silent(create_plink_v1_9_options())
  expect_silent(create_custom_plink_options("my_path"))
})
