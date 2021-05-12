test_that("show help", {
  if (!is_plink_installed()) return()
  expect_silent(run_plink(args = "--help"))
})

test_that("example run", {
  if (!is_plink_installed()) return()
  skip("WIP")
  expect_warning(run_plink(args = "--noweb"))
})
