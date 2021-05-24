test_that("minimal use", {
  expect_silent(read_plink_map_file(get_plink_example_filename("test.map")))
})

test_that("use", {
  t <- read_plink_map_file(get_plink_example_filename("test.map"))
  expect_true("CHR" %in% names(t))
  expect_true("SNP" %in% names(t))
  expect_true("position_cm" %in% names(t))
  expect_true("BP" %in% names(t))
})
