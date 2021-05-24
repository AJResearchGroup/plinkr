test_that("use", {
  if (!is_plink_installed()) return()
  expect_silent(do_plink_self_test())
})

test_that("use, v1.7", {
  if (!is_plink_installed(plink_version = "1.7")) return()
  expect_silent(do_plink_self_test(plink_version = "1.7"))
})

test_that("use, v1.9", {
  if (!is_plink_installed(plink_version = "1.9")) return()
  expect_silent(do_plink_self_test(plink_version = "1.9"))
})
