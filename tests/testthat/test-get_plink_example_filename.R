test_that("use", {
  if (!is_plink_installed()) return()
  expect_true(
    file.exists(
      get_plink_example_filename(
        example_filename = "test.map",
        create_plink_v1_7_options()
      )
    )
  )
  expect_true(
    file.exists(
      get_plink_example_filename(
        example_filename = "test.ped",
        create_plink_v1_7_options()
      )
    )
  )
  expect_true(
    file.exists(
      get_plink_example_filename(
        example_filename = "toy.map",
        create_plink_v1_9_options()
      )
    )
  )
  expect_true(
    file.exists(
      get_plink_example_filename(
        example_filename = "toy.ped",
        create_plink_v1_9_options()
      )
    )
  )
  expect_error(file.exists(get_plink_example_filename("abs.ent")))
})
