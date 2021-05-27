test_that("use", {
  map_table <- get_test_map_table()
  map_filename <- get_plinkr_tempfilename()
  save_map_table_to_file(
    map_table = map_table,
    map_filename = map_filename
  )
  expect_true(file.exists(map_filename))
})

test_that("detailed use, recreate v1.7 test.map file exactly", {
  if (!is_plink_installed(plink_version = "1.7")) return()
  plink_map_filename <- get_plink_example_filename(
    example_filename = "test.map",
    plink_version = "1.7"
  )
  map_table <- read_plink_map_file(
    map_filename = plink_map_filename
  )
  map_filename <- get_plinkr_tempfilename()
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
  expect_equal(readLines(plink_map_filename), readLines(map_filename))
})

test_that("sub-sub-sub folder", {
  map_table <- get_test_map_table()
  map_filename <- file.path(
    get_plinkr_tempfilename(),
    "sub", "sub", "sub", "folder", "test.map"
  )
  save_map_table_to_file(
    map_table = map_table,
    map_filename = map_filename
  )
  expect_true(file.exists(map_filename))
})
