test_that("use", {
  expect_silent(check_plink_version("1.7"))
  expect_silent(check_plink_version(get_default_plink_version()))
  expect_error(check_plink_version("nonsense"))
})
