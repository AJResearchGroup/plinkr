test_that("use", {
  plink_text_filenames <- create_plink_text_filenames(
    ped_filename = "file.ped",
    map_filename = "file.map"
  )
  expect_silent(check_plink_text_filenames(plink_text_filenames))
  expect_error(check_plink_text_filenames("nonsense"))
  expect_error(check_plink_text_filenames(NULL))
  expect_error(check_plink_text_filenames(NA))
  expect_error(check_plink_text_filenames(42))
  expect_error(check_plink_text_filenames(3.14))
  expect_error(check_plink_text_filenames(c()))
  expect_error(check_plink_text_filenames(c(1, 2)))
  expect_error(check_plink_text_filenames(list()))

})
