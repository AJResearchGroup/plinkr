test_that("use", {
  expect_equal(
    file.path(get_plink_folder(), "plink_1_7.zip"),
    get_plink_zip_path(plink_version = "1.7")
  )
})
