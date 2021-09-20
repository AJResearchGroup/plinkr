test_that("minimal use", {
  bed_filename <- get_plinkr_tempfilename(fileext = ".bed")
  save_bed_table_to_file(
    bed_table = get_test_bed_table(),
    bed_filename = bed_filename
  )
  expect_true(file.exists(bed_filename))
  file.remove(bed_filename)

  check_empty_plinkr_folder()
  # clear_plinkr_cache() # nolint
})

test_that("sub-sub-sub folder", {
  bed_table <- get_test_bed_table()
  bed_filename <- file.path(
    get_plinkr_tempfilename(),
    "sub", "sub", "sub", "folder", "test.bed"
  )
  save_bed_table_to_file(
    bed_table = bed_table,
    bed_filename = bed_filename
  )
  expect_true(file.exists(bed_filename))
  file.remove(bed_filename)
  unlink(
    dirname(dirname(dirname(dirname(dirname(bed_filename))))),
    recursive = TRUE
  )
})

test_that("write to impossible folder", {
  # Windows has no impossible folders
  if (get_os() == "win") return()

  bed_table <- get_test_bed_table()
  bed_filename <- "/root/test.bed"

  # Error by genio
  expect_error(
    save_bed_table_to_file(
      bed_table = bed_table,
      bed_filename = bed_filename
    ),
    "Could not open BED file `/root/test.bed` for writing: Permission denied"
  )
})
