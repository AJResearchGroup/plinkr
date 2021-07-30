test_that("use", {
  expect_silent(get_test_fam_table())
})

test_that("same as toy_data.fam", {
  expected <- plinkr::read_plink_fam_file(
    fam_filename = get_plinkr_filename("toy_data.fam")
  )
  actual <- get_test_fam_table()
  expect_identical(actual, expected)
})
