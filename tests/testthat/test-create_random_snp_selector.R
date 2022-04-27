test_that("use", {
  expect_silent(
    create_random_snps_selector(
      n_snps = 1
    )
  )
})

test_that("use, will select zero SNPs, disallow", {
  expect_error(
    create_random_snps_selector(
      n_snps = 0
    ),
    "'random_snps_selector' must select at least 1 base pair"
  )
})
