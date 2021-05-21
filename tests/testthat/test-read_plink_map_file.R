test_that("minimal use", {
  expect_silent(read_plink_map_file(get_plink_example_filename("test.map")))
})

test_that("use", {
  t <- read_plink_map_file(get_plink_example_filename("test.map"))
  expect_true("chromosome_code" %in% names(t))
  expect_true("variant_id" %in% names(t))
  expect_true("position" %in% names(t))
  expect_true("coordinat" %in% names(t))
})
