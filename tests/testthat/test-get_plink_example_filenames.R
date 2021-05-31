test_that("use", {
  if (!is_plink_installed()) return()
  expect_silent(get_plink_example_filenames())
})

test_that("use, v1.7", {
  if (!is_plink_installed(create_plink_v1_7_options())) return()
  expect_silent(get_plink_example_filenames(create_plink_v1_7_options())
  )
})

test_that("use, v1.9", {
  if (!is_plink_installed(create_plink_v1_9_options())) return()
  expect_silent(get_plink_example_filenames(create_plink_v1_9_options()))
})
