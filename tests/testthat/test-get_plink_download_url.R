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

test_that("URLs are valid", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_on_ci()) return()
  folder_name <- get_plinkr_tempfilename()
  dir.create(folder_name, showWarnings = FALSE, recursive = TRUE)
  destfile <- file.path(folder_name, "temp_download.zip")
  for (plink_version in c("1.7", "1.9", "2.0")) {
    for (os in c("unix", "mac", "win")) {
      message(plink_version, " ", os)
      url <- get_plink_download_url(
        plink_version = plink_version,
        os = os
      )
      utils::download.file(
        url = url,
        destfile = destfile,
        quiet = TRUE
      )
      expect_true(file.exists(destfile))
      file.remove(destfile)
    }
  }
  unlink(folder_name, recursive = TRUE)
  check_empty_plinkr_folder()
  clear_plinkr_cache()
})
