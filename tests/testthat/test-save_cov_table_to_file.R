test_that("save and read must result in same table", {
  cov_table <- read_plink_cov_file(
    cov_filename = get_plinkr_filename("pheno.raw")
  )
  cov_filename <- get_plinkr_tempfilename()
  save_cov_table_to_file(
    cov_table = cov_table,
    cov_filename = cov_filename
  )
  cov_table_again <- read_plink_cov_file(
    cov_filename = cov_filename
  )
  expect_equal(names(cov_table), names(cov_table_again))
  expect_equal(nrow(cov_table), nrow(cov_table_again))
  expect_equal(ncol(cov_table), ncol(cov_table_again))
  file.remove(cov_filename) # Fails on AppVeyor?

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})

test_that("save and read must result in same table with correct column names", {
  cov_table <- read_plink_cov_file(
    cov_filename = get_plinkr_filename("pheno.raw")
  )
  names(cov_table) <- c(names(cov_table)[1:2], "my_phenotype")
  cov_filename <- get_plinkr_tempfilename()
  save_cov_table_to_file(
    cov_table = cov_table,
    cov_filename = cov_filename
  )
  readLines(cov_filename)
  cov_table_again <- read_plink_cov_file(
    cov_filename = cov_filename
  )
  expect_equal(names(cov_table), names(cov_table_again))
  file.remove(cov_filename) # Fails on AppVeyor?

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})

test_that("sub-sub-sub folder", {
  cov_table <- read_plink_cov_file(
    cov_filename = get_plinkr_filename("pheno.raw")
  )
  cov_filename <- file.path(
    get_plinkr_tempfilename(),
    "sub", "sub", "sub", "folder", "test.phe"
  )
  save_cov_table_to_file(
    cov_table = cov_table,
    cov_filename = cov_filename
  )
  expect_true(file.exists(cov_filename))
  file.remove(cov_filename)
  unlink(
    dirname(dirname(dirname(dirname(dirname(cov_filename))))),
    recursive = TRUE
  )
})

test_that("write to impossible folder", {
  # Windows has no impossible folders
  if (get_os() == "win") return()
  cov_table <- read_plink_cov_file(
    cov_filename = get_plinkr_filename("pheno.raw")
  )
  cov_filename <- "/root/test.phe"
  expect_error(
    save_cov_table_to_file(
      cov_table = cov_table,
      cov_filename = cov_filename
    ),
    "Cannot save 'cov_table' to path"
  )
})
