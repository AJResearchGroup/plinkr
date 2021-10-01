test_that("use", {
  expect_silent(
    create_plink_text_filenames(
      map_filename = "file.map",
      ped_filename = "file.ped"
    )
  )
})
