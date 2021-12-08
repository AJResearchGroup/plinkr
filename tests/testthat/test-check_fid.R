test_that("use", {
  expect_silent(check_fid(fid = "1"))
  expect_silent(check_fid("BantuKenya"))
  expect_error(check_fid(NA))
  expect_error(check_fid(NULL))
  expect_error(check_fid(Inf))
  expect_error(check_fid(""))
  expect_error(check_fid(c()))
  expect_error(
    check_fid(c("1", "2")),
    "must have one element"
  )
  expect_error(check_fid(3.14))
  expect_error(check_fid(42))
})
