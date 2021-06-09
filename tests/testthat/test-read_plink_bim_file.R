test_that("minimal use", {
  expect_silent(
    read_plink_bim_file(get_plinkr_filename("toy_data.bim"))
  )
  expect_silent(
    read_plink_bim_file(get_plinkr_filename("demo_assoc.bim"))
  )
  expect_silent(
    read_plink_bim_file(get_plinkr_filename("demo_assoc_qt.bim"))
  )
})
