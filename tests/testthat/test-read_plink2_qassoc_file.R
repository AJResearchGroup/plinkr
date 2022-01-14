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
  expect_error(
    read_plink2_qassoc_file(
      "non_existing_filename"
    ),
    ".qassoc file with path 'non_existing_filename' not found"
  )
})
