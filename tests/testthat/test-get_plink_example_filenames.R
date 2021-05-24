test_that("use", {
  expect_silent(get_plink_example_filenames())
  expect_silent(get_plink_example_filenames(plink_version = "1.7"))
  expect_silent(get_plink_example_filenames(plink_version = "1.9"))
})
