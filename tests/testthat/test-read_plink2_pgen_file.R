test_that("minimal use", {

  expect_silent(
    read_plink2_pgen_file(
      pgen_filename = get_plinkr_filename(
        "test_v1_7_after_make-bed_after_make-pgen.pgen"
      ),
      names_loci = c("snp1", "snp2"),
      names_ind = as.character(seq(1, 6))
    )
  )

  expect_silent(
    read_plink2_pgen_file(
      pgen_filename = get_plinkr_filename(
        "toy_v1_9_after_make-bed_after_make-pgen.pgen"
      ),
      names_loci = c("snp1", "snp2"),
      names_ind = rep("1", 2)
    )
  )
})

test_that("create, read, save, read, PLINK2", {
  skip("Need 'save_pgen_table'")
  if (!is_plink_installed(plink_options = create_plink_v2_0_options())) return()

  pgen_filename <- get_plinkr_filename(
    "toy_v1_9_after_make-bed_after_make-pgen.pgen"
  )

  # Read the table
  pgen_table <- read_plink2_pgen_file(pgen_filename = pgen_filename)

  # Save the table
  pgen_filename_again <- get_plinkr_tempfilename(fileext = ".pgen")
  save_pgen_table(
    pgen_table = pgen_table,
    pgen_filename = pgen_filename_again
  )

  # Read the table again
  pgen_table_again <- read_plink2_pgen_file(
    pgen_filename = pgen_filename_again
  )

  expect_identical(pgen_table, pgen_table_again)

  file.remove(pgen_filename_again)
  unlink(folder_name, recursive = TRUE)

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})


test_that("demonstrate .pgen row/column ordering differs from genio's .bed", {

  if (!is_plink_installed()) return()

  clear_plinkr_cache()

  # Convert data
  # 1. Create an asymmetrical PLINK1 text data set
  # 2. Convert to an asymmetrical PLINK1 binary data set
  # 3. Convert to PLINK2 binary

  # Convert using files only
  # 4. Save PLINK1 text data files
  # 5. Convert to PLINK1 binary data files
  # 6. Convert to PLINK2 binary data files

  # Convert data
  # 1. Create an asymmetrical PLINK1 text data set
  assoc_qt_data <- create_demo_assoc_qt_data()
  plink_text_data <- assoc_qt_data$data
  n_individuals <- nrow(assoc_qt_data$data$ped_table)
  expect_equal(3, n_individuals)
  n_snps <- nrow(assoc_qt_data$data$map_table)
  expect_equal(4, n_snps)
  expect_true(n_snps != n_individuals) # must be asymetric

  # 2. Convert to an asymmetrical PLINK1 binary data set
  plink_bin_data <- convert_plink_text_data_to_plink_bin_data(plink_text_data)
  expect_equal(nrow(plink_bin_data$fam_table), n_individuals)
  expect_equal(nrow(plink_bin_data$bim_table), n_snps)
  #' @param bed_table a table that maps the SNPs to the individuals,
  #' of which the column names are the names of the individuals,
  #' the row names are the names of the SNPs,
  #' and the values are the SNP variant.
  expect_equal(ncol(plink_bin_data$bed_table), n_individuals)
  expect_equal(nrow(plink_bin_data$bed_table), n_snps)

  # 3. Convert to an asymmetrical PLINK2 binary data set
  plink2_bin_data <- convert_plink_bin_data_to_plink2_bin_data(plink_bin_data)
  expect_equal(nrow(plink2_bin_data$psam_table), n_individuals)
  expect_equal(nrow(plink2_bin_data$pvar_table), n_snps)
  #' @param pgen_table an \link{array} that maps the individuals
  #'   to their SNPs, with as much rows as individuals, and as much
  #'   SNPs as columns. Optionally, the row names are the individuals' IDs,
  #'   where the column names are the SNP ID's
  expect_equal(nrow(plink2_bin_data$pgen_table), n_individuals)
  expect_equal(ncol(plink2_bin_data$pgen_table), n_snps)

  # Convert using files only
  # 4. Save PLINK1 text data files
  # 5. Convert to PLINK1 binary data files
  # 6. Convert to PLINK2 binary data files
  folder <- get_plinkr_tempfilename()
  plink_text_base_input_filename <- file.path(folder, "plink_text")
  plink_bin_base_input_filename <- file.path(folder, "plink_bin")
  plink2_bin_base_input_filename <- file.path(folder, "plink2_bin")
  save_plink_text_data(
    plink_text_data,
    base_input_filename = plink_text_base_input_filename
  )
  convert_plink_text_files_to_plink_bin_files(
    base_input_filename = plink_text_base_input_filename,
    base_output_filename = plink_bin_base_input_filename
  )
  convert_plink_bin_files_to_plink2_bin_files(
    base_input_filename = plink_bin_base_input_filename,
    base_output_filename = plink2_bin_base_input_filename
  )

  # Each row holds a SNP
  #
  #       1 2 3
  # snp_1 1 0 1
  # snp_2 0 1 1
  # snp_3 2 0 0
  # snp_4 2 0 0

  read_plink_bed_file_from_files(
    bed_filename = paste0(plink_bin_base_input_filename, ".bed"),
    bim_filename = paste0(plink_bin_base_input_filename, ".bim"),
    fam_filename = paste0(plink_bin_base_input_filename, ".fam")
  )

  # Each row holds an individual
  #
  #   snp_1 snp_2 snp_3 snp_4
  # 1     1     0     2     2
  # 2     0     1     0     0
  # 3     1     1     0     0

  read_plink2_pgen_file_from_files(
    pgen_filename = paste0(plink2_bin_base_input_filename, ".pgen"),
    psam_filename = paste0(plink2_bin_base_input_filename, ".psam"),
    pvar_filename = paste0(plink2_bin_base_input_filename, ".pvar")
  )

  unlink(folder, recursive = TRUE)
  expect_silent(check_empty_plinkr_folder())
})

test_that("can read .bed files as well?", {
  skip("By default, all BED files are SNP-major mode, #27")
  expect_silent(
    read_plink2_pgen_file(
      pgen_filename = get_plinkr_filename(
        "test_v1_7_after_make-bed.bed"
      ),
      names_loci = c("snp1", "snp2"),
      names_ind = as.character(seq(1, 6))
    )
  )
})
