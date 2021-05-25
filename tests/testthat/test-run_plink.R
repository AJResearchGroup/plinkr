test_that("show help", {
  if (!is_plink_installed()) return()
  expect_silent(run_plink(args = "--help"))
})

test_that("verbose", {
  if (!is_plink_installed()) return()
  expect_message(run_plink(args = "--help", verbose = TRUE))
})

test_that("no duplicate --noweb flag", {
  if (!is_plink_installed()) return()
  expect_error(
    run_plink(args = "--noweb"),
    "Duplicate --noweb flag"
  )
})
