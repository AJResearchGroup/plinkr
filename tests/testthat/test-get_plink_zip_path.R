test_that("minimal", {
  expect_silent(get_plink_zip_path(create_plink_v1_7_options()))
  expect_silent(get_plink_zip_path(create_plink_v1_9_options()))
})

test_that("v1.7", {
  expect_equal(
    normalizePath(
      file.path(get_plink_folder(), "plink_1_7.zip"), mustWork = FALSE
    ),
    get_plink_zip_path(create_plink_v1_7_options())
  )
})

test_that("v1.9", {
  expect_equal(
    normalizePath(
      file.path(get_plink_folder(), "plink_1_9.zip"), mustWork = FALSE
    ),
    get_plink_zip_path(create_plink_v1_9_options())
  )
})

test_that("v2.0", {
  expect_equal(
    normalizePath(
      file.path(get_plink_folder(), "plink_2_0.zip"), mustWork = FALSE
    ),
    get_plink_zip_path(create_plink_v2_0_options())
  )
})

test_that("custom", {
  expect_error(
    get_plink_zip_path(create_custom_plink_options("irrelevant")),
    "A custom PLINK installation has no default zip path"
  )
})
