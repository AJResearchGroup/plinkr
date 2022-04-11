test_that("use", {
  expect_silent(
    create_snp_window_selector(
      snp = "snp_1",
      window_kb = 0.002
    )
  )
})

test_that("use, will only select 1 SNP, but OK", {
  expect_silent(
    create_snp_window_selector(
      snp = "snp_1",
      window_kb = 0.001
    )
  )
})

test_that("use, will select zero SNPs, disallow", {
  expect_error(
    create_snp_window_selector(
      snp = "snp_1",
      window_kb = 0.000
    ),
    "'snp_window_selector' must select at least 1 base pair"
  )
})
