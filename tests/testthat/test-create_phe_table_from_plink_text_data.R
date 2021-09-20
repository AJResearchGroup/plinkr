test_that("use", {
  plink_text_data <- create_test_plink_text_data()
  phe_table <- create_phe_table_from_plink_text_data(plink_text_data)
  phe_table_too <- create_phe_table_from_ped_table(
    plink_text_data$ped_table
  )
  expect_identical(phe_table, phe_table_too)
})
