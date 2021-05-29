test_that("use", {
  expect_silent(get_plink_download_url(plink_version = "1.7"))
  expect_silent(get_plink_download_url(plink_version = "1.9"))
})

test_that("Linux", {
  expect_silent(get_plink_download_url(plink_version = "1.7", os = "mac"))
  expect_silent(get_plink_download_url(plink_version = "1.9", os = "mac"))
})

test_that("Mac", {
  expect_silent(get_plink_download_url(plink_version = "1.7", os = "mac"))
  expect_silent(get_plink_download_url(plink_version = "1.9", os = "mac"))
})
