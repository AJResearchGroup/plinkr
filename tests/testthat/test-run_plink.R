test_that("use", {
  if (!is_plink_installed()) return()
  skip("WIP")
  expect_silent(run_plink())
})
