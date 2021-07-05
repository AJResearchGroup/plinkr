test_that("minimal use", {
  expect_silent(create_snvs())
  expect_silent(create_snvs(n_snps = 2))
  expect_silent(create_snvs(n_individuals = 2))
})

test_that("2 individuals", {
  snvs <- create_snvs(n_individuals = 2)
  expect_equal(2, nrow(snvs))
})

test_that("2 SNPs", {
  n_snps <- 2

  snvs <- create_snvs(n_snps = n_snps)

  expect_equal(2 * n_snps, ncol(snvs))
  expected_names <- paste0(
    "snv_",
    rep(seq(from = 1, to = n_snps), each = 2),
    rep(c("a", "b"), times = n_snps)
  )
  expect_equal(names(snvs), expected_names)
})

test_that("3 SNPs", {
  n_snps <- 3

  snvs <- create_snvs(
    n_snps = n_snps,
    n_individuals = 4 * 4 * 4
  )

  expect_equal(2 * n_snps, ncol(snvs))
  expected_names <- paste0(
    "snv_",
    rep(seq(from = 1, to = n_snps), each = 2),
    rep(c("a", "b"), times = n_snps)
  )
  expect_equal(names(snvs), expected_names)
})

test_that("create_snvs tests cleans up temp files", {
  expect_silent(check_empty_plinkr_folder())
})
