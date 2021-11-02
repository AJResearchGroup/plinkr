test_that("save and read must result in same table", {
  phe_table <- read_plink_phe_file(
    phe_filename = get_plinkr_filename("pheno.raw")
  )
  phe_filename <- get_plinkr_tempfilename(fileext = ".phe")
  save_phe_table(
    phe_table = phe_table,
    phe_filename = phe_filename
  )
  phe_table_again <- read_plink_phe_file(
    phe_filename = phe_filename
  )
  expect_equal(phe_table, phe_table_again)
  file.remove(phe_filename) # Fails on AppVeyor?

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})

test_that("save and read must result in same table, file with custom header", {
  phe_table <- read_plink_phe_file(
    phe_filename = get_plinkr_filename("pheno_with_standard_header.phe")
  )
  phe_filename <- get_plinkr_tempfilename(fileext = ".phe")
  save_phe_table(
    phe_table = phe_table,
    phe_filename = phe_filename
  )
  phe_table_again <- read_plink_phe_file(
    phe_filename = phe_filename
  )
  expect_equal(phe_table, phe_table_again)
  file.remove(phe_filename)
})


test_that("save and read must result in same table, file with custom header", {
  phe_table <- read_plink_phe_file(
    phe_filename = get_plinkr_filename("pheno_with_custom_header.phe")
  )
  phe_filename <- get_plinkr_tempfilename(fileext = ".phe")
  save_phe_table(
    phe_table = phe_table,
    phe_filename = phe_filename
  )
  phe_table_again <- read_plink_phe_file(
    phe_filename = phe_filename
  )
  expect_equal(phe_table, phe_table_again)
  file.remove(phe_filename) # Fails on AppVeyor?

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})


test_that("save and read must result in same table with correct column names", {
  phe_table <- read_plink_phe_file(
    phe_filename = get_plinkr_filename("pheno.raw")
  )
  names(phe_table) <- c(names(phe_table)[1:2], "my_phenotype")
  phe_filename <- get_plinkr_tempfilename(fileext = ".phe")
  save_phe_table(
    phe_table = phe_table,
    phe_filename = phe_filename
  )
  readLines(phe_filename)
  phe_table_again <- read_plink_phe_file(
    phe_filename = phe_filename
  )
  expect_equal(names(phe_table), names(phe_table_again))
  file.remove(phe_filename) # Fails on AppVeyor?

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()

})

test_that("sub-sub-sub folder", {
  phe_table <- read_plink_phe_file(
    phe_filename = get_plinkr_filename("pheno.raw")
  )
  phe_filename <- file.path(
    get_plinkr_tempfilename(),
    "sub", "sub", "sub", "folder", "test.phe"
  )
  save_phe_table(
    phe_table = phe_table,
    phe_filename = phe_filename
  )
  expect_true(file.exists(phe_filename))
  file.remove(phe_filename)
  unlink(
    dirname(dirname(dirname(dirname(dirname(phe_filename))))),
    recursive = TRUE
  )

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})

test_that("write to impossible folder", {
  # Windows has no impossible folders
  if (get_os() == "win") return()
  phe_table <- read_plink_phe_file(
    phe_filename = get_plinkr_filename("pheno.raw")
  )
  phe_filename <- "/root/test.phe"
  expect_error(
    save_phe_table(
      phe_table = phe_table,
      phe_filename = phe_filename
    ),
    "Cannot save 'phe_table' to path"
  )

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})
