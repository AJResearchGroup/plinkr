test_that("use", {
  if (!is_plink_installed(plink_options = create_plink_v2_0_options())) return()
  bed_filename <- get_plinkr_filename("toy_v1_9_after_make-bed.bed")
  bim_filename <- get_plinkr_filename("toy_v1_9_after_make-bed.bim")
  fam_filename <- get_plinkr_filename("toy_v1_9_after_make-bed.fam")

  # What we know about the plain-text data
  bed_table <- read_plink_bed_file_from_files(
    bed_filename = bed_filename,
    bim_filename = bim_filename,
    fam_filename =  fam_filename
  )
  bim_table <- read_plink_bim_file(
    bim_filename = bim_filename
  )
  fam_table <- read_plink_fam_file(
    fam_filename =  fam_filename
  )
  base_output_filename <- file.path(get_plinkr_tempfilename(), "output")
  filenames <- make_pgen(
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
  plink_options <- create_plink_v2_0_options()

  if (!is_plink_installed(plink_options = plink_options)) return()

  bed_filename <- get_plinkr_filename("toy_v1_9_after_make-bed.bed")
  bim_filename <- get_plinkr_filename("toy_v1_9_after_make-bed.bim")
  fam_filename <- get_plinkr_filename("toy_v1_9_after_make-bed.fam")

  base_output_filename <- file.path(
    get_plinkr_tempfilename(), "output"
  )
  filenames <- make_pgen(
    base_input_filename = tools::file_path_sans_ext(bed_filename),
    base_output_filename = base_output_filename,
    plink_options = plink_options
  )
  # To create the 'toy_v1_9_after_make-bed_after_make-pgen.*' files, I used,
  # in folder '/home/richel/.local/share/plinkr/plink_2_0_unix/':
  #
  #  plink2
  #   --bfile /home/richel/GitHubs/plinkr/inst/extdata/toy_v1_9_after_make-bed  # nolint this is not commented code
  #   --make-pgen
  #   --out ~/toy_v1_9_after_make-bed_after_make-pgen
  #
  #
  pgen_filename <- stringr::str_subset(filenames, "\\.pgen$")
  pgen_filename_too <- get_plinkr_filename(
    "toy_v1_9_after_make-bed_after_make-pgen.pgen"
  )
  expect_equal(
    as.vector(tools::md5sum(pgen_filename)),
    as.vector(tools::md5sum(pgen_filename_too))
  )

  psam_filename <- stringr::str_subset(filenames, "\\.psam$")
  psam_filename_too <- get_plinkr_filename(
    "toy_v1_9_after_make-bed_after_make-pgen.psam"
  )
  expect_equal(
    as.vector(tools::md5sum(psam_filename)),
    as.vector(tools::md5sum(psam_filename_too))
  )

  pvar_filename <- stringr::str_subset(filenames, "\\.pvar$")
  pvar_filename_too <- get_plinkr_filename(
    "toy_v1_9_after_make-bed_after_make-pgen.pvar"
  )
  expect_equal(
    as.vector(tools::md5sum(pvar_filename)),
    as.vector(tools::md5sum(pvar_filename_too))
  )

  unlink(dirname(base_output_filename), recursive = TRUE)

  check_empty_plinkr_folder()
  clear_plinkr_cache() # nolint
})
