library(testthat)
library(plinkr)

test_check("plinkr")

expect_equal(
  0,
  length(list.files(dirname(get_plinkr_tempfilename()), full.names = TRUE))
)
