test_that("use", {
  map_table <- read_plink_map_file(
    map_filename = get_plink_example_filename("test.map")
  )
  map_filename <- tempfile()
  save_map_table_to_file(
    map_table = map_table,
    map_filename = map_filename
  )
  map_table_again <- read_plink_map_file(
    map_filename = map_filename
  )
  expect_equal(names(map_table), names(map_table_again))
  expect_equal(nrow(map_table), nrow(map_table_again))
  expect_equal(ncol(map_table), ncol(map_table_again))
})

test_that("sub-sub-sub folder", {
  map_table <- read_plink_map_file(
    map_filename = get_plink_example_filename("test.map")
  )
  map_filename <- file.path(
    tempfile(), "sub", "sub", "sub", "folder", "test.map"
  )
  save_map_table_to_file(
    map_table = map_table,
    map_filename = map_filename
  )
  expect_true(file.exists(map_filename))
})
