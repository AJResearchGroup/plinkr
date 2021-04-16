test_that("use", {
  if (!is_plink_installed()) return()
  expect_silent(run_plink(args = "--help"))
  expect_warning(run_plink(args = "--noweb"))
})
