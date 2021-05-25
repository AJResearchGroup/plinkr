test_that("use", {
  expect_silent(get_test_ped_table())
})

test_that("identical as PLINK example, 1.7", {
  if (!is_plink_installed(plink_version = "1.7")) return()
  ped_table <- get_test_ped_table()
  plink_ped_table <- plinkr::read_plink_ped_file(
    ped_filename = plinkr::get_plink_example_filename(
      example_filename = "test.ped",
      plink_version = "1.7"
    )
  )
  expect_identical(ped_table, plink_ped_table)
})
