test_that("minimal use", {
  expect_silent(
    read_plink_fam_file(get_plinkr_filename("toy_data.fam"))
  )
  expect_silent(
    read_plink_fam_file(get_plinkr_filename("demo_assoc.fam"))
  )
  expect_silent(
    read_plink_fam_file(get_plinkr_filename("demo_assoc_qt.fam"))
  )
})
