test_that("use", {
  expect_silent(check_plink_version("1.7"))
  expect_silent(check_plink_version("1.9"))
  expect_silent(check_plink_version("custom"))
  expect_silent(check_plink_version(get_default_plink_version()))
  expect_error(check_plink_version("nonsense"))
  expect_error(check_plink_version(NA))
  expect_error(check_plink_version(NULL))
  expect_error(check_plink_version(Inf))
  expect_error(check_plink_version(""))
  expect_error(check_plink_version(c()))
  expect_error(
    check_plink_version(c("1.7", "1.9")),
    "must have one element"
  )
  expect_error(check_plink_version(3.14))
  expect_error(check_plink_version(42))
})
