test_that("use", {
  expect_silent(
    create_assoc_params(
      confidence_interval = 0.95,
      maf = 0.01,
      base_input_filename = "from_there",
      base_output_filename = "to_there"
    )
  )
})
