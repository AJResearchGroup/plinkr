test_that("use", {
  expect_silent(get_test_map_table())
})

test_that("identical as PLINK example", {
  if (!is_plink_installed()) return()
  map_table <- get_test_map_table()
  plink_map_table <- plinkr::read_plink_map_file(
    map_filename = plinkr::get_plink_example_filename(
      example_filename = "test.map",
      plink_version = "1.7"
    )
  )
  expect_identical(map_table, plink_map_table)
})
