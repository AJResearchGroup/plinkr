test_that("use", {
  ped_table <- get_test_ped_table()
  map_table <- get_test_map_table()
  expect_silent(
    create_assoc_data(
      data = create_plink_text_data(
        ped_table = ped_table,
        map_table = map_table
      )
    )
  )
})
