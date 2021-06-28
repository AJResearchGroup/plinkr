test_that("use", {
  phe_table <- read_plink_phe_file(
    phe_filename = get_plinkr_filename("pheno.raw")
  )
  expect_silent(check_phe_table(phe_table))
})

test_that("use", {
  expect_silent(
    check_phe_table(
      create_demo_phe_table()
    )
  )
})

test_that("case-control values in first column", {
  phe_table <- create_demo_phe_table()
  # All ones and twos
  phe_table$random <- 2
  phe_table$random[1] <- 1
  expect_error(
    check_phe_table(
      phe_table
    )
  )
})

test_that("use, second column", {
  phe_table <- create_demo_phe_table()
  # All zeroes, ones and twos
  phe_table$additive <- 2
  phe_table$additive[1] <- 0
  phe_table$additive[2] <- 1
  expect_error(
    check_phe_table(
      phe_table
    )
  )
})
