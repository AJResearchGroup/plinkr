test_that("show help", {
  if (!is_plink_installed(create_plink_v1_7_options())) return()
  expect_silent(run_plink_v1_7(args = "--help"))
})
