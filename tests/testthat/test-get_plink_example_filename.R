test_that("use", {
  if (!is_plink_installed()) return()
  expect_true(file.exists(get_plink_example_filename("test.map")))
  expect_true(file.exists(get_plink_example_filename("test.ped")))
  expect_error(file.exists(get_plink_example_filename("abs.ent")))
})
