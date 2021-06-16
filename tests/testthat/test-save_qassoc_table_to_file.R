test_that("save and read must result in same file, v1.9", {
  skip("Cannot reproduce .qassoc files exactly")
  qassoc_table <- read_plink_qassoc_file(
    qassoc_filename = get_plinkr_filename("assoc_qt_output_1_snp.qassoc")
  )
  qassoc_filename_again <- get_plinkr_tempfilename()
  save_qassoc_table_to_file(
    qassoc_table = qassoc_table,
    qassoc_filename = qassoc_filename_again
  )


  expect_identical(
    readr::read_lines(get_plinkr_filename("assoc_qt_output_1_snp.qassoc")),
    readr::read_lines(qassoc_filename_again)
  )
  file.remove(qassoc_filename_again)
})

test_that("read and save must result in same file, v1.9", {
  qassoc_table <- read_plink_qassoc_file(
    qassoc_filename = get_plinkr_filename("assoc_qt_output_1_snp.qassoc")
  )
  qassoc_filename <- get_plinkr_tempfilename()
  save_qassoc_table_to_file(
    qassoc_table = qassoc_table,
    qassoc_filename = qassoc_filename
  )
  qassoc_table_again <- read_plink_qassoc_file(
    qassoc_filename = qassoc_filename
  )
  expect_identical(qassoc_table, qassoc_table_again)
  file.remove(qassoc_filename)
})
