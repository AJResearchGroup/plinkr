test_that("use", {
  expect_silent(get_plinkr_filename("plink.log"))
  expect_error(get_plinkr_filename("abs.ent"))
})

test_that("pheno.raw", {
  expect_silent(get_plinkr_filename("pheno.raw"))
  # 6 individuals
  expect_equal(
    6,
    length(readLines(get_plinkr_filename("pheno.raw")))
  )
  # 3 columns
  expect_equal(
    3,
    ncol(
      readr::read_delim(
        get_plinkr_filename("pheno.raw"),
        delim = " ",
        col_names = c("FID", "IID", "phenotype"),
        col_types = readr::cols(
          family_id = readr::col_double(),
          individual_id = readr::col_double(),
          phenotype = readr::col_double()
        )
      )
    )
  )
})
