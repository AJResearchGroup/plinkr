test_that("use", {
  expect_error(
    uninstall_plinks("nonsense"),
    "must be a list"
  )

  if (get_os() != "win") expect_silent(check_empty_plinkr_folder())
})
