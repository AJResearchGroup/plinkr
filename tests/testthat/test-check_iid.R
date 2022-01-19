test_that("use", {
  expect_silent(check_iid(iid = "1"))
  expect_silent(check_iid("BantuKenya"))
  expect_error(check_iid(NA))
  expect_error(check_iid(NULL))
  expect_error(check_iid(Inf))
  expect_error(check_iid(""))
  expect_error(check_iid(c()))
  expect_error(
    check_iid(c("1", "2")),
    "must have one element"
  )
  expect_error(check_iid(3.14))
  expect_error(check_iid(42))
})
