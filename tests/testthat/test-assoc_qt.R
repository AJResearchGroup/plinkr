test_that("use", {
  if (!is_plink_installed()) return()
  ped_table <- read_plink_ped_file(ped_filename = get_plink_example_filename("test.ped"))
  map_table <- read_plink_map_file(map_filename = get_plink_example_filename("test.map"))
  ped_table$phenotype_value <- runif(n = nrow(ped_table))
  expect_silent(
    assoc_qt(
      ped_table = ped_table,
      map_table = map_table,
      maf = 0.05
    )
  )
})
