################################################################################
#
# PLINK1 v1.7
#
################################################################################
test_that("use, v1.7", {
  if (!is_plink_installed(plink_options = create_plink_v1_7_options())) return()
  map_filename <- get_plinkr_filename("test_v1_7.map")
  ped_filename <- get_plinkr_filename("test_v1_7.ped")
  base_output_filename <- file.path(get_plinkr_tempfilename(), "output")
  filenames <- make_bed(
    base_input_filename = tools::file_path_sans_ext(ped_filename),
    base_output_filename = base_output_filename,
    plink_options = create_plink_v1_7_options()
  )
  expect_equal(
    filenames,
    list.files(
      path = dirname(base_output_filename),
      full.names = TRUE
    )
  )
  unlink(dirname(base_output_filename), recursive = TRUE)

  check_empty_plinkr_folder()
  clear_plinkr_cache() # nolint
})

test_that("files exactly reproduced, from v1.7", {
  plink_options <- create_plink_v1_7_options()

  if (!is_plink_installed(plink_options = plink_options)) return()


  map_filename <- get_plinkr_filename("test_v1_7.map")
  ped_filename <- get_plinkr_filename("test_v1_7.ped")

  if (1 == 2) {
    # Must be same files as PLINK v1.7 example files
    map_filename_too <- get_plink_example_filename(
      "test.map", plink_options = plink_options
    )

    ped_filename_too <- get_plink_example_filename(
      "test.ped", plink_options = plink_options
    )
    expect_equal(readLines(map_filename), readLines(map_filename_too))
    expect_equal(readLines(ped_filename), readLines(ped_filename_too))
  }

  base_output_filename <- file.path(
    get_plinkr_tempfilename(), "output"
  )
  filenames <- make_bed(
    base_input_filename = tools::file_path_sans_ext(ped_filename),
    base_output_filename = base_output_filename,
    plink_options = plink_options
  )
  # To create the 'test_v1_7_after_make-bed.*' files, I used,
  # in folder '~/.local/share/plinkr/plink_1_7_unix':
  #
  #  ./plink --file test --make-bed --out ~/test_v1_7_after_make-bed --noweb
  #
  #
  bed_filename <- stringr::str_subset(filenames, "\\.bed$")
  bed_filename_too <- get_plinkr_filename("test_v1_7_after_make-bed.bed")
  expect_equal(
    as.vector(tools::md5sum(bed_filename)),
    as.vector(tools::md5sum(bed_filename_too))
  )

  bim_filename <- stringr::str_subset(filenames, "\\.bim$")
  bim_filename_too <- get_plinkr_filename("test_v1_7_after_make-bed.bim")
  expect_equal(
    as.vector(tools::md5sum(bim_filename)),
    as.vector(tools::md5sum(bim_filename_too))
  )

  fam_filename <- stringr::str_subset(filenames, "\\.fam$")
  fam_filename_too <- get_plinkr_filename("test_v1_7_after_make-bed.fam")
  expect_equal(
    as.vector(tools::md5sum(fam_filename)),
    as.vector(tools::md5sum(fam_filename_too))
  )

  unlink(dirname(base_output_filename), recursive = TRUE)

  check_empty_plinkr_folder()
  clear_plinkr_cache() # nolint
})

test_that("files exactly reproduced, from v1.7", {
  plink_options <- create_plink_v1_7_options()

  if (!is_plink_installed(plink_options = plink_options)) return()


  map_filename <- get_plinkr_filename("test_v1_7.map")
  ped_filename <- get_plinkr_filename("test_v1_7.ped")

  if (1 == 2) {
    # Must be same files as PLINK v1.7 example files
    map_filename_too <- get_plink_example_filename(
      "test.map", plink_options = plink_options
    )

    ped_filename_too <- get_plink_example_filename(
      "test.ped", plink_options = plink_options
    )
    expect_equal(readLines(map_filename), readLines(map_filename_too))
    expect_equal(readLines(ped_filename), readLines(ped_filename_too))
  }

  base_output_filename <- file.path(
    get_plinkr_tempfilename(), "output"
  )
  filenames <- make_bed(
    base_input_filename = tools::file_path_sans_ext(ped_filename),
    base_output_filename = base_output_filename,
    plink_options = plink_options
  )
  # To create the 'test_v1_7_after_make-bed.*' files, I used,
  # in folder '~/.local/share/plinkr/plink_1_7_unix':
  #
  #  ./plink --file test --make-bed --out ~/test_v1_7_after_make-bed --noweb
  #
  #
  bed_filename <- stringr::str_subset(filenames, "\\.bed$")
  bed_filename_too <- get_plinkr_filename("test_v1_7_after_make-bed.bed")
  expect_equal(
    as.vector(tools::md5sum(bed_filename)),
    as.vector(tools::md5sum(bed_filename_too))
  )

  bim_filename <- stringr::str_subset(filenames, "\\.bim$")
  bim_filename_too <- get_plinkr_filename("test_v1_7_after_make-bed.bim")
  expect_equal(
    as.vector(tools::md5sum(bim_filename)),
    as.vector(tools::md5sum(bim_filename_too))
  )

  fam_filename <- stringr::str_subset(filenames, "\\.fam$")
  fam_filename_too <- get_plinkr_filename("test_v1_7_after_make-bed.fam")
  expect_equal(
    as.vector(tools::md5sum(fam_filename)),
    as.vector(tools::md5sum(fam_filename_too))
  )

  unlink(dirname(base_output_filename), recursive = TRUE)

  check_empty_plinkr_folder()
  clear_plinkr_cache() # nolint
})
################################################################################
#
# PLINK1 v1.9
#
################################################################################
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

  check_empty_plinkr_folder()
  clear_plinkr_cache() # nolint
})

test_that("files exactly reproduced, from v1.9", {
  plink_options <- create_plink_v1_9_options()

  if (!is_plink_installed(plink_options = plink_options)) return()


  map_filename <- get_plinkr_filename("toy_v1_9.map")
  ped_filename <- get_plinkr_filename("toy_v1_9.ped")

  if (1 == 2) {
    # Must be same files as PLINK v1.9 example files
    map_filename_too <- get_plink_example_filename(
      "toy.map", plink_options = plink_options
    )

    ped_filename_too <- get_plink_example_filename(
      "toy.ped", plink_options = plink_options
    )
    expect_equal(readLines(map_filename), readLines(map_filename_too))
    expect_equal(readLines(ped_filename), readLines(ped_filename_too))
  }

  base_output_filename <- file.path(
    get_plinkr_tempfilename(), "output"
  )
  filenames <- make_bed(
    base_input_filename = tools::file_path_sans_ext(ped_filename),
    base_output_filename = base_output_filename,
    plink_options = plink_options
  )
  # To create the 'toy_v1_9_after_make-bed.*' files, I used,
  # in folder '~/.local/share/plinkr/plink_1_9_unix':
  #
  #  ./plink --file toy --make-bed --out ~/toy_v1_9_after_make-bed --noweb
  #
  # (note that '--noweb' can be safely removed)
  bed_filename <- stringr::str_subset(filenames, "\\.bed$")
  bed_filename_too <- get_plinkr_filename("toy_v1_9_after_make-bed.bed")
  expect_equal(
    as.vector(tools::md5sum(bed_filename)),
    as.vector(tools::md5sum(bed_filename_too))
  )

  bim_filename <- stringr::str_subset(filenames, "\\.bim$")
  bim_filename_too <- get_plinkr_filename("toy_v1_9_after_make-bed.bim")
  expect_equal(
    as.vector(tools::md5sum(bim_filename)),
    as.vector(tools::md5sum(bim_filename_too))
  )

  fam_filename <- stringr::str_subset(filenames, "\\.fam$")
  fam_filename_too <- get_plinkr_filename("toy_v1_9_after_make-bed.fam")
  expect_equal(
    as.vector(tools::md5sum(fam_filename)),
    as.vector(tools::md5sum(fam_filename_too))
  )

  unlink(dirname(base_output_filename), recursive = TRUE)

  check_empty_plinkr_folder()
  clear_plinkr_cache() # nolint
})

test_that("use, from test data, v1.9", {
  if (!is_plink_installed(plink_options = create_plink_v1_9_options())) return()
  folder <- get_plinkr_tempfilename()
  map_filename <- file.path(folder, "input.map")
  ped_filename <- file.path(folder, "input.ped")
  assoc_data <- create_test_assoc_data()
  save_map_table(
    map_table = assoc_data$data$map_table,
    map_filename = map_filename
  )
  save_ped_table(
    ped_table = assoc_data$data$ped_table,
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

################################################################################
#
# PLINK2 v2.0
#
################################################################################
test_that("use, PLINK2, PLINK text data, must fail", {
  if (!is_plink_installed(plink_options = create_plink_v2_0_options())) return()

  expect_error(
    make_bed(
      base_input_filename = tools::file_path_sans_ext(
        get_plinkr_filename("toy_v1_9.map")
      ),
      base_output_filename = "irrelevant",
      plink_options = create_plink_v2_0_options()
    ),
    "No PLINK2 binary files \\(.pgen, .psam and .pvar\\) files found"
  )
  expect_silent(check_empty_plinkr_folder())
})

test_that("use, PLINK2, PLINK2 binary data, works", {
  clear_plinkr_cache()
  expect_silent(check_empty_plinkr_folder())

  if (!is_plink_installed(plink_options = create_plink_v2_0_options())) return()

  base_output_filename <- file.path(
    get_plinkr_tempfilename(), "make_bed_results_from_plink2_data"
  )

  filenames <- make_bed(
    base_input_filename = tools::file_path_sans_ext(
      get_plinkr_filename("toy_v1_9_after_make-bed_after_make-pgen.pgen")
    ),
    base_output_filename = base_output_filename,
    plink_options = create_plink_v2_0_options()
  )
  expect_equal(
    filenames,
    list.files(
      path = dirname(base_output_filename),
      pattern = "make_bed_results_from_plink2_data",
      full.names = TRUE
    )
  )
  file.remove(filenames)
  unlink(dirname(filenames[1]), recursive = TRUE)

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})
