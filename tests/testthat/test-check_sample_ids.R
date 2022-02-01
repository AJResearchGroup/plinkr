test_that("use", {
  # For PLINK, a .phe table contains the sample IDs
  phe_table <- get_test_phe_table()
  sample_ids <- phe_table[, 1:2]
  expect_silent(check_sample_ids(sample_ids))

  # For PLINK2, a .psam table contains the sample IDs
  psam_table <- get_test_psam_table()
  sample_ids <- psam_table[, 1:2]
  expect_silent(check_sample_ids(sample_ids))

  expect_error(check_sample_ids(""))
  expect_error(check_sample_ids(NA))
  expect_error(check_sample_ids(NULL))
  expect_error(check_sample_ids(Inf))
  expect_error(check_sample_ids(3.14))
  expect_error(check_sample_ids(42))
  expect_error(check_sample_ids(c("random", "")))
})
