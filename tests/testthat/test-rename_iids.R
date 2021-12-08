test_that("use, PLINK text data", {
  data_before <- create_test_plink_text_data()
  new_iids <- as.character(1 + data_before$ped_table$IID)
  expect_true(all(data_before$ped_table$IID != new_iids))
  data_after <- rename_iids(
    data = data_before,
    iids = new_iids
  )
  expect_true(all(data_after$ped_table$IID == new_iids))
})

test_that("use, assoc_qt data", {
  data_before <- create_test_assoc_qt_data()
  new_iids <- as.character(1 + data_before$data$ped_table$IID)
  expect_true(all(data_before$data$ped_table$IID != new_iids))
  expect_true(all(data_before$phenotype_data$phe_table$IID != new_iids))
  data_after <- rename_iids(
    data = data_before,
    iids = new_iids
  )
  expect_true(all(data_after$data$ped_table$IID == new_iids))
  expect_true(all(data_after$phenotype_data$phe_table$IID == new_iids))
})
