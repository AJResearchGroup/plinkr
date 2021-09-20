test_that("minimal use", {
  expect_silent(get_plink1_versions())
})

test_that("valid versions", {
  for (plink_version in get_plink1_versions()) {
    expect_silent(check_plink_version(plink_version))
  }
})
