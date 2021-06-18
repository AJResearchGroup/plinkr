test_that("minimal use", {
  lmiss_filenames <- stringr::str_subset(get_plinkr_filenames(), "\\.lmiss$")
  for (lmiss_filename in lmiss_filenames) {
    expect_silent(
      read_plink_lmiss_file(
        lmiss_filename = lmiss_filename
      )
    )
  }
})
