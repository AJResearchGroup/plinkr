test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_plink_tutorial_data_installed()) return()
  ped_filename <- stringr::str_subset(
    get_plink_tutorial_data_filenames(), "hapmap1.ped"
  )
  lines <- readr::read_lines(ped_filename)
  expect_silent(
    safe_str_split(
      lines,
      pattern = "[:blank:]+",
      simplify = TRUE
    )
  )
})
