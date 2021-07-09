test_that("use", {
  expect_silent(create_demo_map_table())
  expect_silent(
    check_map_table(create_demo_map_table(create_random_trait()))
  )
  expect_silent(
    check_map_table(create_demo_map_table(create_additive_trait()))
  )
  expect_silent(
    check_map_table(create_demo_map_table(create_epistatic_trait()))
  )
})

test_that("correct number of SNPs, 1 trait", {
  expect_equal(1, nrow(create_demo_map_table(create_random_trait())))
  expect_equal(2, nrow(create_demo_map_table(create_random_trait(n_snps = 2))))
  expect_equal(1, nrow(create_demo_map_table(create_additive_trait())))
  expect_equal(2, nrow(create_demo_map_table(create_epistatic_trait())))
})

test_that("correct number of SNPs, 2 trais", {
  expect_equal(
    5,
    nrow(
      create_demo_map_table(
        traits = list(
          create_random_trait(n_snps = 3),
          create_epistatic_trait(n_snps = 2)
        )
      )
    )
  )
})

test_that("Can handle 100 SNPs", {
  # default PLINK can handle a maximum of 95 chromosomes.
  # (see https://www.cog-genomics.org/plink/1.9/input#chr_set)
  expect_silent(
    check_map_table(
      create_demo_map_table(create_random_trait(n_snps = 100))
    )
  )
  if (get_os() != "win") expect_silent(check_empty_plinkr_folder())
})
