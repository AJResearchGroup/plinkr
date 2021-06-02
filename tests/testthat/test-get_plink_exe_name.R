test_that("use, Linux", {
  expect_equal(
    get_plink_exe_name(plink_version = "1.7", os = "unix"),
    "plink"
  )
  expect_equal(
    get_plink_exe_name(plink_version = "1.9", os = "unix"),
    "plink"
  )
  expect_equal(
    get_plink_exe_name(plink_version = "2.0", os = "unix"),
    "plink2"
  )
})

test_that("use, Mac", {
  expect_equal(
    get_plink_exe_name(plink_version = "1.7", os = "mac"),
    "plink"
  )
  expect_equal(
    get_plink_exe_name(plink_version = "1.9", os = "mac"),
    "plink"
  )
  expect_equal(
    get_plink_exe_name(plink_version = "2.0", os = "mac"),
    "plink2"
  )
})

test_that("use, Windows", {
  expect_equal(
    get_plink_exe_name(plink_version = "1.7", os = "win"),
    "plink.exe"
  )
  expect_equal(
    get_plink_exe_name(plink_version = "1.9", os = "win"),
    "plink.exe"
  )
  expect_equal(
    get_plink_exe_name(plink_version = "2.0", os = "win"),
    "plink2.exe"
  )
})

test_that("use, Windows", {
  expect_error(
    get_plink_exe_name(plink_version = "custom"),
    "Cannot predict PLINK executable name for a custom version"
  )
})
