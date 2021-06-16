test_that("minimal use", {
  expect_silent(
    create_assoc_args(
      assoc_params = create_test_assoc_params(),
      plink_options = create_plink_v1_7_options()
    )
  )
  expect_silent(
    create_assoc_args(
      assoc_params = create_test_assoc_params(),
      plink_options = create_plink_v1_9_options()
    )
  )
  expect_silent(
    create_assoc_args(
      assoc_params = create_test_assoc_params(),
      plink_options = create_plink_v2_0_options()
    )
  )
})

test_that("v1.7", {
  assoc_params <- create_test_assoc_params()
  created <- create_assoc_args(
    assoc_params = assoc_params,
    plink_options = create_plink_v1_7_options()
  )
  expected <- c(
    "--map", paste0(assoc_params$base_input_filename, ".map"),
    "--ped", paste0(assoc_params$base_input_filename, ".ped"),
    "--assoc",
    "--maf", assoc_params$maf,
    "--ci", assoc_params$confidence_interval,
    "--out", assoc_params$base_output_filename
  )
  expect_equal(created, expected)

  # This does an association
  expect_true("--assoc" %in% created)

  # PLINK v1.7 does not support these
  expect_false("--allow-extra-chr" %in% created)
  expect_false("--chr-set" %in% created)

})

test_that("v1.9, allow 95 chromosome", {
  assoc_params <- create_test_assoc_params()
  created <- create_assoc_args(
    assoc_params = assoc_params,
    plink_options = create_plink_v1_9_options()
  )
  expected <- c(
    "--map", paste0(assoc_params$base_input_filename, ".map"),
    "--ped", paste0(assoc_params$base_input_filename, ".ped"),
    "--assoc",
    # "--allow-extra-chr",
    "--chr-set", 95,
    "--maf", assoc_params$maf,
    "--ci", assoc_params$confidence_interval,
    "--out", assoc_params$base_output_filename
  )
  expect_equal(created, expected)

  # This does an association
  expect_true("--assoc" %in% created)

})

test_that("v2.0", {
  skip("WIP: no idea to call PLINK2 to do assoc yet")
  assoc_params <- create_test_assoc_params()
  created <- create_assoc_args(
    assoc_params = assoc_params,
    plink_options = create_plink_v2_0_options()
  )
  # No idea yet
  expect_true("--glm" %in% created)

  # PLINK v2.0 does not support this
  expect_false("--assoc" %in% created)
})
