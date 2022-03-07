test_that("case-control values in first column", {
  phe_table <- create_demo_phe_table()
  # All ones and twos
  phe_table$random <- 2
  phe_table$random[1] <- 1
  expect_error(
    check_phe_table_ok_for_qt(
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
    check_phe_table_ok_for_qt(
      phe_table
    )
  )
})

test_that("only FID and IID columns", {
  phe_table <- create_demo_phe_table()
  # All zeroes, ones and twos
  phe_table <- phe_table[, c(1, 2)]
  check_phe_table(phe_table)
  expect_error(
    check_phe_table_ok_for_qt(
      phe_table
    ),
    "Must have at least 1 phenotype for a quantitative trait analysis"
  )
})
