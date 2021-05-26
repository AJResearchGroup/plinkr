test_that("use", {
  phenotype_table <- read_plink_phenotype_file(
    phenotype_filename = get_plinkr_filename("pheno.raw")
  )
  expect_silent(check_phenotype_table(phenotype_table))
})

test_that("use", {
  expect_silent(
    check_phenotype_table(
      create_demo_phenotype_table()
    )
  )
})

test_that("case-control values in first column", {
  phenotype_table <- create_demo_phenotype_table()
  # All ones and twos
  phenotype_table$random <- 2
  phenotype_table$random[1] <- 1
  expect_error(
    check_phenotype_table(
      phenotype_table
    )
  )
})

test_that("use, second column", {
  phenotype_table <- create_demo_phenotype_table()
  # All zeroes, ones and twos
  phenotype_table$additive <- 2
  phenotype_table$additive[1] <- 0
  phenotype_table$additive[2] <- 1
  expect_error(
    check_phenotype_table(
      phenotype_table
    )
  )
})
