test_that("save and read must result in same table", {
  phenotype_table <- read_plink_phenotype_file(
    phenotype_filename = get_plinkr_filename("pheno.raw")
  )
  phenotype_filename <- get_plinkr_tempfilename()
  save_phenotype_table_to_file(
    phenotype_table = phenotype_table,
    phenotype_filename = phenotype_filename
  )
  phenotype_table_again <- read_plink_phenotype_file(
    phenotype_filename = phenotype_filename
  )
  expect_equal(names(phenotype_table), names(phenotype_table_again))
  expect_equal(nrow(phenotype_table), nrow(phenotype_table_again))
  expect_equal(ncol(phenotype_table), ncol(phenotype_table_again))
  file.remove(phenotype_filename)
})

test_that("save and read must result in same table with correct column names", {
  phenotype_table <- read_plink_phenotype_file(
    phenotype_filename = get_plinkr_filename("pheno.raw")
  )
  names(phenotype_table) <- c(names(phenotype_table)[1:2], "my_phenotype")
  phenotype_filename <- get_plinkr_tempfilename()
  save_phenotype_table_to_file(
    phenotype_table = phenotype_table,
    phenotype_filename = phenotype_filename
  )
  readLines(phenotype_filename)
  phenotype_table_again <- read_plink_phenotype_file(
    phenotype_filename = phenotype_filename
  )
  expect_equal(names(phenotype_table), names(phenotype_table_again))
  file.remove(phenotype_filename)
})

test_that("sub-sub-sub folder", {
  phenotype_table <- read_plink_phenotype_file(
    phenotype_filename = get_plinkr_filename("pheno.raw")
  )
  phenotype_filename <- file.path(
    get_plinkr_tempfilename(),
    "sub", "sub", "sub", "folder", "test.phenotype"
  )
  save_phenotype_table_to_file(
    phenotype_table = phenotype_table,
    phenotype_filename = phenotype_filename
  )
  expect_true(file.exists(phenotype_filename))
  file.remove(phenotype_filename)
  unlink(
    dirname(dirname(dirname(dirname(dirname(phenotype_filename))))),
    recursive = TRUE
  )
})

test_that("write to impossible folder", {
  # Windows has no impossible folders
  if (get_os() == "win") return()
  phenotype_table <- read_plink_phenotype_file(
    phenotype_filename = get_plinkr_filename("pheno.raw")
  )
  phenotype_filename <- "/root/test.phenotype"
  expect_error(
    save_phenotype_table_to_file(
      phenotype_table = phenotype_table,
      phenotype_filename = phenotype_filename
    ),
    "Cannot save 'phenotype_table' to path"
  )
})
