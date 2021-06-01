test_that("use", {
  expect_silent(get_plink_download_url(plink_version = "1.7"))
  expect_silent(get_plink_download_url(plink_version = "1.9"))
  expect_silent(get_plink_download_url(plink_version = "2.0"))
})

test_that("Linux", {
  expect_silent(get_plink_download_url(plink_version = "1.7", os = "unix"))
  expect_silent(get_plink_download_url(plink_version = "1.9", os = "unix"))
  expect_silent(get_plink_download_url(plink_version = "2.0", os = "unix"))
})

test_that("Mac", {
  expect_silent(get_plink_download_url(plink_version = "1.7", os = "mac"))
  expect_silent(get_plink_download_url(plink_version = "1.9", os = "mac"))
  expect_silent(get_plink_download_url(plink_version = "2.0", os = "mac"))
})

test_that("Windows", {
  expect_silent(get_plink_download_url(plink_version = "1.7", os = "win"))
  expect_silent(get_plink_download_url(plink_version = "1.9", os = "win"))
  expect_silent(get_plink_download_url(plink_version = "2.0", os = "win"))
})
