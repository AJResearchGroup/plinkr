test_that("use", {
  expect_equal(
    file.path(get_plink_folder(), "plink-1.07-x86_64", "plink"),
    get_plink_exe_path()
  )
})
