test_that("use", {
  expect_silent(check_ped_table(get_test_ped_table()))
  expect_error(check_ped_table("nonsense"))
})

test_that("evil use", {
  skip("Not yet")
  ped_table <- get_test_ped_table()
  ped_table$snv_2c <- ped_table$snv_2b
  expect_error(check_ped_table(ped_table))
})
