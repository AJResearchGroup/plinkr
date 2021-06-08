test_that("show help", {
  if (!is_plink_installed(create_plink_v1_9_options())) return()
  expect_silent(run_plink_v1_9(args = "--help"))
})
