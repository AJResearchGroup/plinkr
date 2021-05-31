test_that("minimal use, v1.7", {
  if (!is_plink_installed(create_plink_v1_7_options())) return()
  expect_silent(
    read_plink_map_file(
      get_plink_example_filename(
        example_filename = "test.map",
        create_plink_v1_7_options()
      )
    )
  )
})

test_that("minimal use, v1.9", {
  if (!is_plink_installed(create_plink_v1_9_options())) return()
  expect_silent(
    read_plink_map_file(
      get_plink_example_filename(
        example_filename = "toy.map",
        create_plink_v1_9_options()
      )
    )
  )
})

test_that("use, v1.7", {
  if (!is_plink_installed(create_plink_v1_7_options())) return()
  t <- read_plink_map_file(
    get_plink_example_filename(
      example_filename = "test.map",
      create_plink_v1_7_options()
    )
  )
  expect_true("CHR" %in% names(t))
  expect_true("SNP" %in% names(t))
  expect_true("position_cm" %in% names(t))
  expect_true("BP" %in% names(t))
})

test_that("use, v1.9", {
  if (!is_plink_installed(create_plink_v1_9_options())) return()
  t <- read_plink_map_file(
    get_plink_example_filename(
      example_filename = "toy.map",
      create_plink_v1_9_options()
    )
  )
  expect_true("CHR" %in% names(t))
  expect_true("SNP" %in% names(t))
  expect_true("position_cm" %in% names(t))
  expect_true("BP" %in% names(t))
})
