test_that("use, v1.7", {
  if (!is_plink_installed(plink_options = create_plink_v1_7_options())) return()
  folder <- get_plinkr_tempfilename()
  map_filename <- file.path(folder, "input.map")
  ped_filename <- file.path(folder, "input.ped")
  assoc_params <- create_test_assoc_params()
  save_map_table_to_file(
    map_table = assoc_params$map_table,
    map_filename = map_filename
  )
  save_ped_table_to_file(
    ped_table = assoc_params$ped_table,
    ped_filename = ped_filename
  )

  filenames <- make_bed(
    base_input_filename = tools::file_path_sans_ext(ped_filename),
    base_output_filename = file.path(dirname(ped_filename), "output"),
    plink_options = create_plink_v1_7_options()
  )
  expect_equal(
    filenames,
    list.files(
      path = dirname(ped_filename),
      pattern = "output",
      full.names = TRUE
    )
  )
  unlink(folder, recursive = TRUE)
})

test_that("use, from files, v1.9", {
  if (!is_plink_installed(plink_options = create_plink_v1_9_options())) return()
  folder <- get_plinkr_tempfilename()
  map_filename <- get_plinkr_filename("demo_assoc_qt.map")
  ped_filename <- get_plinkr_filename("demo_assoc_qt.ped")
  filenames <- make_bed(
    base_input_filename = tools::file_path_sans_ext(ped_filename),
    base_output_filename = file.path(folder, "output"),
    plink_options = create_plink_v1_9_options()
  )
  expect_equal(
    filenames,
    list.files(
      path = folder,
      pattern = "output",
      full.names = TRUE
    )
  )
  unlink(folder, recursive = TRUE)
})

test_that("use, from test data, v1.9", {
  if (!is_plink_installed(plink_options = create_plink_v1_9_options())) return()
  folder <- get_plinkr_tempfilename()
  map_filename <- file.path(folder, "input.map")
  ped_filename <- file.path(folder, "input.ped")
  assoc_params <- create_test_assoc_params()
  save_map_table_to_file(
    map_table = assoc_params$map_table,
    map_filename = map_filename
  )
  save_ped_table_to_file(
    ped_table = assoc_params$ped_table,
    ped_filename = ped_filename
  )

  filenames <- make_bed(
    base_input_filename = tools::file_path_sans_ext(ped_filename),
    base_output_filename = file.path(dirname(ped_filename), "output"),
    plink_options = create_plink_v1_9_options()
  )
  expect_equal(
    filenames,
    list.files(
      path = dirname(ped_filename),
      pattern = "output",
      full.names = TRUE
    )
  )
  unlink(folder, recursive = TRUE)
})

test_that("use, v2.0", {
  if (!is_plink_installed(plink_options = create_plink_v2_0_options())) return()
  expect_error(
    make_bed(
      base_input_filename = "irrelevant",
      base_output_filename = "irrelevant",
      plink_options = create_plink_v2_0_options()
    ),
    "PLINK2 cannot convert '.map' and '.ped' files"
  )
})
