test_that("minimal use", {
  expect_silent(get_plink_subfolder(create_plink_v1_7_options()))
  expect_silent(get_plink_subfolder(create_plink_v1_9_options()))
  expect_silent(get_plink_subfolder(create_plink_v2_0_options()))
})

test_that("minimal use different OS", {
  for (os in c("unix", "mac", "win")) {
    expect_silent(get_plink_subfolder(create_plink_v1_7_options(os = os)))
    expect_silent(get_plink_subfolder(create_plink_v1_9_options(os = os)))
    expect_silent(get_plink_subfolder(create_plink_v2_0_options(os = os)))
  }
})

test_that("abuse", {
  expect_error(
    get_plink_subfolder(
      create_custom_plink_options("irrelevant")
    ),
    "Cannot predict the PLINK subfolder for a custom PLINK version"
  )
})
