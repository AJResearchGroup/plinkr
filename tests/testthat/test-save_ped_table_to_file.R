test_that("minimal use, using get_test_ped_table", {
  ped_table <- get_test_ped_table()
  ped_filename <- get_plinkr_tempfilename()
  save_ped_table_to_file(
    ped_table = ped_table,
    ped_filename = ped_filename
  )
  expect_true(file.exists(ped_filename))
  file.remove(ped_filename)
})

test_that("detailed use, exactly re-create PLINK v1.7 file", {
  if (!is_plink_installed(create_plink_v1_7_options())) return()
  plink_ped_filename <- get_plink_example_filename(
    example_filename = "test.ped",
    create_plink_v1_7_options()
  )
  ped_table <- read_plink_ped_file(
    ped_filename = plink_ped_filename
  )
  ped_filename <- get_plinkr_tempfilename()
  save_ped_table_to_file(
    ped_table = ped_table,
    ped_filename = ped_filename
  )
  plink_ped_text <- readr::read_lines(plink_ped_filename)
  ped_text <- readr::read_lines(ped_filename)
  expect_equal(length(plink_ped_text), length(ped_text))
  expect_equal(plink_ped_text, ped_text)
  file.remove(ped_filename)
})

test_that("sub-sub-sub folder", {
  ped_table <- get_test_ped_table()
  ped_filename <- file.path(
    get_plinkr_tempfilename(),
    "sub", "sub", "sub", "folder", "test.ped"
  )
  save_ped_table_to_file(
    ped_table = ped_table,
    ped_filename = ped_filename
  )
  expect_true(file.exists(ped_filename))
  file.remove(ped_filename)
  unlink(
    dirname(dirname(dirname(dirname(dirname(ped_filename))))),
    recursive = TRUE
  )
})

test_that("write to impossible folder", {
  # Windows has no impossible folders
  if (get_os() == "win") return()
  ped_table <- read_plink_ped_file(get_plinkr_filename("demo_assoc.ped"))
  ped_filename <- "/root/test.ped"

  expect_error(
    save_ped_table_to_file(
      ped_table = ped_table,
      ped_filename = ped_filename
    ),
    "Cannot save 'ped_table' to path"
  )
})
