test_that("use", {
  expect_silent(
    read_plink_ped_file(
      ped_filename = get_plink_example_filename("test.ped")
    )
  )
})
