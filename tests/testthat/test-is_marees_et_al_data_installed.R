test_that("use", {
  expect_false(is_marees_et_al_data_installed())
  expect_false(is_marees_et_al_data_installed(plink_folder = "absent_folder"))
})
