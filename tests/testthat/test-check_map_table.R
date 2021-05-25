test_that("use", {
  expect_silent(check_map_table(get_test_map_table()))
  expect_silent(check_map_table(create_demo_map_table()))
  expect_error(check_map_table("nonsense"))
})
