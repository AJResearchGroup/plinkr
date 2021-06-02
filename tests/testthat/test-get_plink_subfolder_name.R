test_that("minimal use", {
  expect_silent(get_plink_subfolder_name())
  expect_silent(get_plink_subfolder_name("1.7"))
  expect_silent(get_plink_subfolder_name("1.9"))
  expect_silent(get_plink_subfolder_name("2.0"))
})

test_that("minimal use different OS", {
  for (os in c("unix", "mac", "win")) {
    expect_silent(get_plink_subfolder_name("1.7", os = os))
    expect_silent(get_plink_subfolder_name("1.9", os = os))
    expect_silent(get_plink_subfolder_name("2.0", os = os))
  }
})

test_that("custom", {
  expect_error(
    get_plink_subfolder_name(
      plink_version = "custom"
    ),
    "Cannot predict the PLINK subfolder for a custom PLINK version"
  )
})

test_that("abuse", {
  expect_error(
    get_plink_subfolder_name(
      plink_version = "nonsense"
    ),
    "Invalid 'plink_version'"
  )
})
