test_that("use", {
  if (!is_plink_installed()) return()
  expect_silent(get_plink_example_filenames())
})

test_that("use, v1.7", {
  if (!is_plink_installed(plink_version = "1.7")) return()
  expect_silent(get_plink_example_filenames(plink_version = "1.7"))
})

test_that("use, v1.9", {
  if (!is_plink_installed(plink_version = "1.9")) return()
  expect_silent(get_plink_example_filenames())
  expect_silent(get_plink_example_filenames(plink_version = "1.9"))
})
