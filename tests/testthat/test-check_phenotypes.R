test_that("use", {
  expect_silent(check_phenotypes("random"))
  expect_silent(check_phenotypes("additive"))
  expect_silent(check_phenotypes(get_phenotypes()))
  expect_error(check_phenotypes("nonsense"))
})
