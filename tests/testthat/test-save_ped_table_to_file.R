test_that("use", {
  ped_table <- read_plink_ped_file(
    ped_filename = get_plink_example_filename("test.ped")
  )
  ped_filename <- tempfile()
  save_ped_table_to_file(
    ped_table = ped_table,
    ped_filename = ped_filename
  )
  ped_table_again <- read_plink_ped_file(
    ped_filename = ped_filename
  )
  expect_equal(names(ped_table), names(ped_table_again))
  expect_equal(nrow(ped_table), nrow(ped_table_again))
  expect_equal(ncol(ped_table), ncol(ped_table_again))
})

test_that("sub-sub-sub folder", {
  ped_table <- read_plink_ped_file(
    ped_filename = get_plink_example_filename("test.ped")
  )
  ped_filename <- file.path(
    tempfile(), "sub", "sub", "sub", "folder", "test.ped"
  )
  save_ped_table_to_file(
    ped_table = ped_table,
    ped_filename = ped_filename
  )
  expect_true(file.exists(ped_filename))
})
