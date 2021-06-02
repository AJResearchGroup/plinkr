test_that("use", {
  expect_silent(check_plink_optionses(create_plink_optionses()))
  expect_error(
    check_plink_optionses("nonsense"),
    "must be a list"
  )
})
