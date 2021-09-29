test_that("save and read must result in same file, v1.9", {
  skip("Cannot reproduce .qassoc files exactly")
  qassoc_table <- read_plink_qassoc_file(
    qassoc_filename = get_plinkr_filename("assoc_qt_output_1_snp.qassoc")
  )
  qassoc_filename_again <- get_plinkr_tempfilename()
  save_qassoc_table(
    qassoc_table = qassoc_table,
    qassoc_filename = qassoc_filename_again
  )
  expect_identical(
    readr::read_lines(get_plinkr_filename("assoc_qt_output_1_snp.qassoc")),
    readr::read_lines(qassoc_filename_again)
  )
  file.remove(qassoc_filename_again)

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})

test_that("read and save must result in same file, v1.7", {
  qassoc_table <- read_plink_qassoc_file(
    qassoc_filename = get_plinkr_filename("assoc_qt_output_1_snp.qassoc")
  )
  qassoc_filename <- get_plinkr_tempfilename()
  save_qassoc_table(
    qassoc_table = qassoc_table,
    qassoc_filename = qassoc_filename,
    plink_options = create_plink_v1_7_options()
  )
  qassoc_table_again <- read_plink_qassoc_file(
    qassoc_filename = qassoc_filename
  )
  expect_identical(qassoc_table, qassoc_table_again)
  file.remove(qassoc_filename) # Fails on AppVeyor?

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})

test_that("read and save must result in same file, v1.9", {
  qassoc_table <- read_plink_qassoc_file(
    qassoc_filename = get_plinkr_filename("assoc_qt_output_1_snp.qassoc")
  )
  qassoc_filename <- get_plinkr_tempfilename()
  save_qassoc_table(
    qassoc_table = qassoc_table,
    qassoc_filename = qassoc_filename
  )
  qassoc_table_again <- read_plink_qassoc_file(
    qassoc_filename = qassoc_filename
  )
  expect_identical(qassoc_table, qassoc_table_again)
  file.remove(qassoc_filename)

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})

test_that("cannot write to impossible folder, v1.9", {
  if (get_os() == "win") return()
  qassoc_table <- read_plink_qassoc_file(
    qassoc_filename = get_plinkr_filename("assoc_qt_output_1_snp.qassoc")
  )
  expect_error(
    save_qassoc_table(
      qassoc_table = qassoc_table,
      qassoc_filename = "/root/assoc_qt_output_1_snp.qassoc"
    ),
    "permission"
  )

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})
