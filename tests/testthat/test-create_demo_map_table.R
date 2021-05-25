test_that("use", {
  expect_silent(create_demo_map_table())
  expect_silent(check_map_table(create_demo_map_table()))
})
