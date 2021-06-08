test_that("show help", {
  if (!is_plink_installed(create_plink_v2_0_options())) return()
  expect_silent(run_plink_v2_0(args = "--help"))
})
