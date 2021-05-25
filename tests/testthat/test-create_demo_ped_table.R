test_that("use", {
  expect_silent(create_demo_ped_table())
  expect_silent(check_ped_table(create_demo_ped_table()))
})
