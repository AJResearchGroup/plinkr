test_that("use", {
  expect_silent(
    create_random_snp_selector(
      n_snps = 1,
    )
  )
})

test_that("use, will select zero SNPs, disallow", {
  expect_error(
    create_random_snp_selector(
      n_snps = 0,
    ),
    "'random_snp_selector' must select at least 1 base pair"
  )
})
