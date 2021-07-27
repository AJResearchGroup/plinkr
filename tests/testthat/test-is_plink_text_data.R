test_that("use", {
  skip("WIP")
  plink_text_data <- create_plink_text_data(
    ped_table = get_test_ped_table(),
    map_table = get_test_map_table()
  )
  expect_true(is_plink_text_data(plink_text_data))
})
