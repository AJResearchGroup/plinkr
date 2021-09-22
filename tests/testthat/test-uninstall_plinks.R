test_that("use", {
  expect_error(
    uninstall_plinks("nonsense"),
    "must be a list"
  )

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})
