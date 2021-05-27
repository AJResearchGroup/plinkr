test_that("use", {
  expect_silent(create_demo_map_table())
  expect_silent(check_map_table(create_demo_map_table(create_random_trait())))
  expect_silent(check_map_table(create_demo_map_table(create_additive_trait())))
  expect_silent(check_map_table(create_demo_map_table(create_epistatic_trait())))
})

test_that("correct number of SNPs", {
  expect_equal(
    1,
    nrow(create_demo_map_table(create_random_trait()))
  )
  expect_equal(
    1,
    nrow(create_demo_map_table(create_additive_trait()))
  )
  expect_equal(
    2,
    nrow(create_demo_map_table(create_epistatic_trait()))
  )
})
