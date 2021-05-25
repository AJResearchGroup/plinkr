test_that("use", {
  expect_true("random" %in% get_phenotypes())
  expect_true("additive" %in% get_phenotypes())
})
