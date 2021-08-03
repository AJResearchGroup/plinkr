test_that("use", {
  if (!is_plink_installed()) return()
  expect_silent(do_plink_self_test())
  expect_message(do_plink_self_test(verbose = TRUE))
  expect_silent(check_empty_plinkr_folder())
})

test_that("use, v1.7", {
  if (!is_plink_installed(create_plink_v1_7_options())) return()
  expect_silent(do_plink_self_test(create_plink_v1_7_options()))
  expect_silent(check_empty_plinkr_folder())
})

test_that("use, v1.9", {
  if (!is_plink_installed(create_plink_v1_9_options())) return()
  expect_silent(do_plink_self_test(create_plink_v1_9_options()))
  expect_silent(check_empty_plinkr_folder())
})
