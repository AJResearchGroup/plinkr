test_that("use", {
  expect_silent(get_plinkr_tempfilename())
  expect_silent(get_plinkr_tempfilename(pattern = "test"))
  expect_silent(get_plinkr_tempfilename(fileext = ".xml"))
})
