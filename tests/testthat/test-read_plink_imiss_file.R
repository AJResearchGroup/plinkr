test_that("minimal use", {
  imiss_filenames <- stringr::str_subset(
    get_plinkr_filenames(), "\\.imiss$"
  )
  for (imiss_filename in imiss_filenames) {
    expect_silent(
      read_plink_imiss_file(
        imiss_filename = imiss_filename
      )
    )
  }
})
