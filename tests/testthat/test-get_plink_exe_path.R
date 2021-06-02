test_that("use", {
  expect_silent(get_plink_exe_path(create_plink_options()))
  expect_silent(get_plink_exe_path(create_plink_v1_7_options()))
  expect_silent(get_plink_exe_path(create_plink_v1_9_options()))
  expect_silent(get_plink_exe_path(create_custom_plink_options("mypath")))
})

test_that("v1.7", {
  expect_equal(
    file.path(get_plink_folder(), "plink-1.07-x86_64", "plink"),
    get_plink_exe_path(create_plink_v1_7_options())
  )
})

test_that("v1.7, tempfolder, Linux", {
  folder <- get_plinkr_tempfilename()
  plink_options <- create_plink_v1_7_options(
    plink_folder = folder,
    os = "unix"
  )
  expect_equal(
    file.path(folder, "plink-1.07-x86_64", "plink"),
    get_plink_exe_path(plink_options)
  )
})

test_that("v1.7, tempfolder, Linux", {
  skip("WIP")
  folder <- get_plinkr_tempfilename()
  plink_options <- create_plink_v1_7_options(
    plink_folder = folder,
    os = "win"
  )
  expect_equal(
    file.path(folder, "plink-1.07-x86_64", "plink.exe"),
    get_plink_exe_path(plink_options)
  )
})

test_that("v1.9", {
  expect_equal(
    file.path(get_plink_folder(), "plink_1_9", "plink"),
    get_plink_exe_path(create_plink_v1_9_options())
  )
})

test_that("custom", {
  expect_equal(
    file.path("my_path", "plink"),
    get_plink_exe_path(create_custom_plink_options("my_path"))
  )
})
