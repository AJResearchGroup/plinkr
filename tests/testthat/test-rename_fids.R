test_that("use, PLINK text data", {
  data_before <- create_test_plink_text_data()
  new_fids <- as.character(1 + data_before$ped_table$FID)
  expect_true(all(data_before$ped_table$FID != new_fids))
  data_after <- rename_fids(
    data = data_before,
    fids = new_fids
  )
  expect_true(all(data_after$ped_table$FID == new_fids))
})

test_that("use, assoc_qt data", {
  data_before <- create_test_assoc_qt_data()
  new_fids <- as.character(1 + data_before$data$ped_table$FID)
  expect_true(all(data_before$data$ped_table$FID != new_fids))
  expect_true(all(data_before$phenotype_data$phe_table$FID != new_fids))
  data_after <- rename_fids(
    data = data_before,
    fids = new_fids
  )
  expect_true(all(data_after$data$ped_table$FID == new_fids))
  expect_true(all(data_after$phenotype_data$phe_table$FID == new_fids))
})
