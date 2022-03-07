test_that("use", {
  expect_true(is_ped_table(get_test_ped_table()))
  expect_true(is_ped_table(ped_table = create_demo_ped_table()))
  expect_false(is_ped_table("nonsense"))
  expect_message(is_ped_table("nonsense", verbose = TRUE))
})
