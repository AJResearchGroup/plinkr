test_that("use", {
  expect_true(file.exists(get_plink_example_filename("test.map")))
  expect_true(file.exists(get_plink_example_filename("test.ped")))
  expect_error(file.exists(get_plink_example_filename("abs.ent")))
})
