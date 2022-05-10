test_that("use", {
  expect_silent(
    check_pca_result_filenames(create_test_pca_result_filenames())
  )
})
