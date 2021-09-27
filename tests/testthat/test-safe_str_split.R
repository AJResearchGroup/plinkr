test_that("use", {

  skip("Cannot read 'hapmap1.ped' without stringi")
  string <- c(
    "1 1 0 0 1  0  C C  C  A  A  C  A C",
    "2 1 0 0 1  0  A A  A  C  C  A  A A",
    "3 1 0 0 1  0  A A  A  A  A  A  C A"
  )
  # safe_str_split(string = string[1], pattern = " +")

  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_plink_tutorial_data_installed()) return()
  ped_filename <- stringr::str_subset(
    get_plink_tutorial_data_filenames(), "hapmap1.ped"
  )
  lines <- readr::read_lines(ped_filename)
  expect_silent(
    safe_str_split(
      string = lines
    )
  )
})
