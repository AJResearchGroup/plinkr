test_that("use", {
  expect_silent(
    read_plink2_qassoc_file(
      qassoc_filename = get_plinkr_filename(
        "plink2_assoc_output.additive.glm.linear"
      )
    )
  )
  expect_silent(
    read_plink2_qassoc_file(
      get_plinkr_filename("plink2_assoc_output.random.glm.linear")
    )
  )
})
