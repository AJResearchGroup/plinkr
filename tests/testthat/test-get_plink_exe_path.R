# test_that("use", {
#   expect_silent(get_plink_exe_path(create_plink_options()))
#   expect_silent(get_plink_exe_path(create_plink_v1_7_options()))
#   expect_silent(get_plink_exe_path(create_plink_v1_9_options()))
#   expect_silent(get_plink_exe_path(create_custom_plink_options("mypath")))
# })
#
# test_that("v1.7, unix", {
#   expect_equal(
#     file.path(get_plink_folder(), "plink_1_7_unix", "plink"),
#     get_plink_exe_path(create_plink_v1_7_options(os = "unix"))
#   )
# })
#
# test_that("v1.7, tempfolder, Linux", {
#   folder <- get_plinkr_tempfilename()
#   plink_options <- create_plink_v1_7_options(
#     plink_folder = folder,
#     os = "unix"
#   )
#   expect_equal(
#     file.path(folder, "plink_1_7_unix", "plink"),
#     get_plink_exe_path(plink_options)
#   )
# })
#
# test_that("v1.7, tempfolder, Windows", {
#   folder <- get_plinkr_tempfilename()
#   plink_options <- create_plink_v1_7_options(
#     plink_folder = folder,
#     os = "win"
#   )
#   expect_equal(
#     file.path(folder, "plink_1_7_win", "plink.exe"),
#     get_plink_exe_path(plink_options)
#   )
# })
#
# test_that("v1.9, Mac", {
#   expect_equal(
#     file.path(get_plink_folder(), "plink_1_9_mac", "plink"),
#     get_plink_exe_path(create_plink_v1_9_options(os = "mac"))
#   )
# })
#
# test_that("custom", {
#   plink_exe_path <- "my/path/plink3.exe"
#   plink_options <- create_custom_plink_options(plink_exe_path = plink_exe_path)
#   expect_equal(
#     plink_exe_path,
#     plink_options$plink_exe_path
#   )
# })
