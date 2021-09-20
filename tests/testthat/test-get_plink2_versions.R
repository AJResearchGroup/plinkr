test_that("minimal use", {
  expect_silent(get_plink2_versions())
})

test_that("valid versions", {
  for (plink_version in get_plink2_versions()) {
    expect_silent(check_plink_version(plink_version))
  }
})
