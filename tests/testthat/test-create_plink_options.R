test_that("use", {
  expect_silent(create_plink_options())
  expect_silent(create_plink_v1_7_options())
  expect_silent(create_plink_v1_9_options())
  expect_silent(create_custom_plink_options("my_path"))
})

test_that("add_noweb", {
  expect_true(create_plink_options()$add_noweb)
  plink_options <- create_plink_options(add_noweb = FALSE)
  expect_false(plink_options$add_noweb)
})
