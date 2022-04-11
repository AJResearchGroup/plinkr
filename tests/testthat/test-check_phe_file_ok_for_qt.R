test_that("use, OK file", {
  phe_filename <- get_plinkr_filename("demo_assoc_qt.phe")
  expect_silent(check_phe_file_ok_for_qt(phe_filename))
})

test_that("use, invalid file", {
  phe_filename <- get_plinkr_tempfilename(fileext = ".phe")
  phe_table <- get_test_phe_table()
  phe_table$P1 <- sample(x = c(0, 1, 2), size = nrow(phe_table), replace = TRUE) # nolint PLINK variable naming convention
  save_phe_table(phe_table = phe_table, phe_filename = phe_filename)
  expect_error(
    check_phe_file_ok_for_qt(phe_filename),
    "Phenotypic values match case-control values"
  )
  file.remove(phe_filename)
})
