test_that("save and read must result in same table", {
  phe_table <- read_plink_phe_file(
    phe_filename = get_plinkr_filename("pheno.raw")
  )
  phe_filename <- get_plinkr_tempfilename()
  save_phe_table_to_file(
    phe_table = phe_table,
    phe_filename = phe_filename
  )
  phe_table_again <- read_plink_phe_file(
    phe_filename = phe_filename
  )
  expect_equal(names(phe_table), names(phe_table_again))
  expect_equal(nrow(phe_table), nrow(phe_table_again))
  expect_equal(ncol(phe_table), ncol(phe_table_again))
  file.remove(phe_filename)
})

test_that("save and read must result in same table with correct column names", {
  phe_table <- read_plink_phe_file(
    phe_filename = get_plinkr_filename("pheno.raw")
  )
  names(phe_table) <- c(names(phe_table)[1:2], "my_phenotype")
  phe_filename <- get_plinkr_tempfilename()
  save_phe_table_to_file(
    phe_table = phe_table,
    phe_filename = phe_filename
  )
  readLines(phe_filename)
  phe_table_again <- read_plink_phe_file(
    phe_filename = phe_filename
  )
  expect_equal(names(phe_table), names(phe_table_again))
  file.remove(phe_filename)
})

test_that("sub-sub-sub folder", {
  phe_table <- read_plink_phe_file(
    phe_filename = get_plinkr_filename("pheno.raw")
  )
  phe_filename <- file.path(
    get_plinkr_tempfilename(),
    "sub", "sub", "sub", "folder", "test.phenotype"
  )
  save_phe_table_to_file(
    phe_table = phe_table,
    phe_filename = phe_filename
  )
  expect_true(file.exists(phe_filename))
  file.remove(phe_filename)
  unlink(
    dirname(dirname(dirname(dirname(dirname(phe_filename))))),
    recursive = TRUE
  )
})

test_that("write to impossible folder", {
  # Windows has no impossible folders
  if (get_os() == "win") return()
  phe_table <- read_plink_phe_file(
    phe_filename = get_plinkr_filename("pheno.raw")
  )
  phe_filename <- "/root/test.phenotype"
  expect_error(
    save_phe_table_to_file(
      phe_table = phe_table,
      phe_filename = phe_filename
    ),
    "Cannot save 'phe_table' to path"
  )
})
