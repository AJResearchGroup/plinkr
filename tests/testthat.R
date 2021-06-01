library(testthat)
library(plinkr)

clear_plinkr_cache()

test_check("plinkr")

expect_equal(
  0,
  length(list.files(dirname(get_plinkr_tempfilename()), full.names = TRUE))
)
