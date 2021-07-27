test_that("use", {
  plink_text_data <- create_plink_text_data(
    ped_table = get_test_ped_table(),
    map_table = get_test_map_table()
  )
  expect_silent(check_plink_text_data(plink_text_data = plink_text_data))

  expect_error(check_plink_text_data(NULL))
  expect_error(check_plink_text_data(NA))
  expect_error(check_plink_text_data(Inf))
  expect_error(check_plink_text_data(3.14))
  expect_error(check_plink_text_data(42))
  expect_error(check_plink_text_data("nonsense"))
  expect_error(check_plink_text_data(c()))
  expect_error(check_plink_text_data(list()))
})
