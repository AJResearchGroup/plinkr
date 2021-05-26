test_that("use", {
  ped_table <- get_test_ped_table()
  map_table <- get_test_map_table()
  phenotype_table <- plinkr::create_phenotype_table_from_ped_table(
    ped_table = ped_table
  )
  phenotype_table$phenotype_value <- 0.1 * seq_len(nrow(phenotype_table))
  expect_silent(
    create_assoc_qt_params(
      ped_table = ped_table,
      map_table = map_table,
      phenotype_table = phenotype_table
    )
  )
})
