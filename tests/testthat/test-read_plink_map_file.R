test_that("minimal use, v1.7", {
  if (!is_plink_installed(plink_version = "1.7")) return()
  expect_silent(
    read_plink_map_file(
      get_plink_example_filename(
        example_filename = "test.map",
        plink_version = "1.7"
      )
    )
  )
})

test_that("minimal use, v1.9", {
  if (!is_plink_installed(plink_version = "1.9")) return()
  expect_silent(
    read_plink_map_file(
      get_plink_example_filename(
        example_filename = "toy.map",
        plink_version = "1.9"
      )
    )
  )
})

test_that("use, v1.7", {
  if (!is_plink_installed(plink_version = "1.7")) return()
  t <- read_plink_map_file(
    get_plink_example_filename(
      example_filename = "test.map",
      plink_version = "1.7"
    )
  )
  expect_true("CHR" %in% names(t))
  expect_true("SNP" %in% names(t))
  expect_true("position_cm" %in% names(t))
  expect_true("BP" %in% names(t))
})

test_that("use, v1.9", {
  if (!is_plink_installed(plink_version = "1.9")) return()
  t <- read_plink_map_file(
    get_plink_example_filename(
      example_filename = "toy.map",
      plink_version = "1.9"
    )
  )
  expect_true("CHR" %in% names(t))
  expect_true("SNP" %in% names(t))
  expect_true("position_cm" %in% names(t))
  expect_true("BP" %in% names(t))
})
