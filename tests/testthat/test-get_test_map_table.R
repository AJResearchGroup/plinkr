test_that("use", {
  expect_silent(get_test_map_table())
  expect_silent(check_map_table(get_test_map_table()))
})

test_that("identical as PLINK v1.7 example", {
  if (!is_plink_installed(create_plink_v1_7_options())) return()
  map_table <- get_test_map_table()
  plink_map_table <- plinkr::read_plink_map_file(
    map_filename = plinkr::get_plink_example_filename(
      example_filename = "test.map",
      create_plink_v1_7_options()
    )
  )
  expect_identical(map_table, plink_map_table)
})
