test_that("minimal use, using get_test_ped_table", {
  ped_table <- get_test_ped_table()
  ped_filename <- tempfile()
  save_ped_table_to_file(
    ped_table = ped_table,
    ped_filename = ped_filename
  )
  expect_true(file.exists(ped_filename))
})

test_that("detailed use, exactly re-create PLINK v1.7 file", {
  if (!is_plink_installed(plink_version = "1.7")) return()
  plink_ped_filename <- get_plink_example_filename(
    example_filename = "test.ped",
    plink_version = "1.7"
  )
  ped_table <- read_plink_ped_file(
    ped_filename = plink_ped_filename
  )
  ped_filename <- tempfile()
  save_ped_table_to_file(
    ped_table = ped_table,
    ped_filename = ped_filename
  )
  plink_ped_text <- readr::read_lines(plink_ped_filename)
  ped_text <- readr::read_lines(ped_filename)
  expect_equal(length(plink_ped_text), length(ped_text))
  expect_equal(plink_ped_text, ped_text)
})

test_that("sub-sub-sub folder", {
  ped_table <- read_plink_ped_file(
    ped_filename = get_plink_example_filename(
      example_filename = "test.ped",
      plink_version = "1.7"
    )
  )
  ped_filename <- file.path(
    tempfile(), "sub", "sub", "sub", "folder", "test.ped"
  )
  save_ped_table_to_file(
    ped_table = ped_table,
    ped_filename = ped_filename
  )
  expect_true(file.exists(ped_filename))
})
