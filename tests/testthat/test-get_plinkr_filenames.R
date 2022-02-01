test_that("use", {
  expect_silent(get_plinkr_filenames())
})

test_that("check if invalid files are out", {
  filenames <- get_plinkr_filenames()
  forbidden_filenames <- c(
    "toy_v1_9_after_make-bed_after_make-pgen.bed",
    "toy_v1_9_after_make-bed_after_make-pgen.bim",
    "toy_v1_9_after_make-bed_after_make-pgen.fam",
    "toy_v1_9_after_make-bed_after_make-pgen.log",
    "toy_v1_9_after_make-bed_after_make-pgen.map"
  )
  for (forbidden_filename in forbidden_filenames) {
    expect_equal(
      0,
      length(
        stringr::str_subset(
          filenames,
          forbidden_filename
        )
      )
    )
  }
  expect_silent(get_plinkr_filenames())
})
