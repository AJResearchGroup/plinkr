test_that("use", {
  if (!is_plink_installed()) return()
  expect_silent(do_plink_self_test())
})
