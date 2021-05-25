test_that("minimal use", {
  expect_silent(
    create_demo_phenotype_table(
      ped_table = create_demo_ped_table()
    )
  )
})

test_that("same number of individuals in ped and phenotype tables", {
  ped_table <- create_demo_ped_table(n_snps = 2)
  phenotype_table <- create_demo_phenotype_table(
    ped_table = ped_table
  )
  expect_equal(nrow(ped_table), nrow(phenotype_table))
})
