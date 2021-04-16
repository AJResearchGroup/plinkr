test_that("use", {
  expect_equal(
    get_plink_folder(),
    rappdirs::user_data_dir(appname = "plinkr")
  )
})
