test_that("use", {
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
    base_output_filename = file.path(dirname(ped_filename), "output")
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
