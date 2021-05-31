test_that("minimal use", {
  expect_silent(create_plink_optionses())
})

test_that("as much optionses as supported PLINK versions", {
  expect_equal(
    length(create_plink_optionses()),
    length(get_plink_versions())
  )
})
