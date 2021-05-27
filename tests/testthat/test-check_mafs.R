test_that("use", {
  expect_silent(check_mafs(0.3))
  expect_silent(check_mafs(get_lowest_maf()))
  expect_silent(check_mafs(get_heighest_maf()))
  expect_silent(check_mafs(c(0.2, 0.1)))
  expect_silent(check_mafs(c(0.3, 0.2, 0.1)))

  expect_error(check_mafs(0.0))
  expect_error(check_mafs(0.5))
  expect_error(check_mafs(-1.0))
  expect_error(check_mafs(2.0))

  expect_error(
    check_mafs(c(0.1, 0.2, 0.3)),
    "'mafs' must be ordered from common.*to rare"
  )
  expect_error(
    check_mafs(c(0.4, 0.39, 0.38)),
    "The sum of the 'mafs' must be below 1.0"
  )
  expect_error(
    check_mafs(c(0.4, 0.3, 0.2)),
    "The major allele frequency must exceed the heighest minor allele frequency"
  )
  expect_error(check_mafs(c(0.04, 0.03, 0.02, 0.01)))
  expect_error(check_mafs("nonsense"))
  expect_error(check_mafs(""))
  expect_error(check_mafs(NA))
  expect_error(check_mafs(NULL))
  expect_error(check_mafs(Inf))
  expect_error(check_mafs(c()))
  expect_error(check_mafs(list()))

})
