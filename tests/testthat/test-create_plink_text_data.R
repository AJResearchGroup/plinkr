test_that("use", {
  expect_silent(
    create_plink_text_data(
      ped_table = get_test_ped_table(),
      map_table = get_test_map_table()
    )
  )
  expect_error(
    create_plink_text_data(
      ped_table = "nonsense",
      map_table = get_test_map_table()
    )
  )
  expect_error(
    create_plink_text_data(
      ped_table = get_test_ped_table(),
      map_table = "nonsense"
    )
  )
})
