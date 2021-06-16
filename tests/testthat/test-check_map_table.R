test_that("use", {
  expect_silent(check_map_table(get_test_map_table()))
  expect_silent(check_map_table(create_demo_map_table()))
  expect_error(check_map_table("nonsense"))
})

test_that("Can handle 95 chromosomes", {
  map_table <- get_test_map_table()
  expect_silent(check_map_table(map_table))
  map_table$CHR[1] <- 96
  expect_error(
    check_map_table(map_table),
    "PLINK can handle a maximum of 95 chromosomes"
  )
})
