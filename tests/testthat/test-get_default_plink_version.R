test_that("use", {
  expect_true(get_default_plink_version() %in% get_plink_versions())
})
