test_that("use", {
  expect_true(is_map_table(get_test_map_table()))
  expect_true(is_map_table(map_table = create_demo_map_table()))
  expect_false(is_map_table("nonsense"))
  expect_message(is_map_table("nonsense", verbose = TRUE))
})
