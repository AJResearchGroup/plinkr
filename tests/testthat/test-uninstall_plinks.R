test_that("use", {
  expect_error(
    uninstall_plinks("nonsense"),
    "must be a list"
  )
})
