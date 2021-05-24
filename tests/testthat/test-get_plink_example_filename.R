test_that("use", {
  if (!is_plink_installed()) return()
  expect_true(
    file.exists(
      get_plink_example_filename(
        example_filename = "test.map",
        plink_version = "1.7"
      )
    )
  )
  expect_true(
    file.exists(
      get_plink_example_filename(
        example_filename = "test.ped",
        plink_version = "1.7"
      )
    )
  )
  expect_error(file.exists(get_plink_example_filename("abs.ent")))
})
