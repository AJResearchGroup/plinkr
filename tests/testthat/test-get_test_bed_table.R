test_that("use", {
  expect_silent(get_test_bed_table())
})

test_that("same as toy_data.bed", {
  bed_table_1 <- plinkr::read_plink_bed_file(
    bed_filename = get_plinkr_filename("toy_data.bed"),
    names_loci = get_test_bim_table()$id,
    names_ind = get_test_fam_table()$id
  )
  bed_table_2 <- get_test_bed_table()
  expect_identical(bed_table_1, bed_table_2)
})
