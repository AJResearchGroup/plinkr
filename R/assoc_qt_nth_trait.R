#' Let PLINK detect an association with the n-th quantitative trait
#'
#' @note This function is named after the \code{--assoc} flag used by PLINK
#' @inheritParams default_params_doc
#' @param n the nth trait. Use '1' for the first trait
#' @author Richèl J.C. Bilderbeek
#' @export
assoc_qt_nth_trait <- function(
  assoc_qt_params,
  n,
  plink_options = create_plink_options(),
  verbose = FALSE
) {
  plinkr::check_assoc_qt_params(assoc_qt_params)
  testthat::expect_true(n >= 1)
  plinkr::check_plink_options(plink_options)
  n_traits <- ncol(assoc_qt_params$phenotype_table) - 2
  if (n > n_traits) {
    stop(
      "Cannot associate the nth trait, as it is absent \n",
      "number of traits: ", n_traits, " \n",
      "n: ", n
    )
  }

  plinkr::check_assoc_qt_params(assoc_qt_params)

  # Do not be smart yet
  ped_table <- assoc_qt_params$ped_table
  map_table <- assoc_qt_params$map_table
  phenotype_table <- assoc_qt_params$phenotype_table
  maf <- assoc_qt_params$maf

  # Of the phenotypes, only keep the nth phenotype
  trait_index <- 2 + n
  keep_indices <- c(1, 2, trait_index)
  phenotype_table <- phenotype_table[, keep_indices]
  testthat::expect_equal(3, ncol(phenotype_table))

  # Filenames
  temp_folder <- plinkr::get_plinkr_tempfilename()
  base_input_filename <- file.path(temp_folder, "assoc_qt_input")
  output_filename_base <- file.path(temp_folder, "assoc_qt_output")
  ped_filename <- paste0(base_input_filename, ".ped")
  map_filename <- paste0(base_input_filename, ".map")
  phenotype_filename <- paste0(base_input_filename, ".phenotype")
  qassoc_filename <- paste0(output_filename_base, ".qassoc")
  log_filename <- paste0(output_filename_base, ".log")


  plinkr::save_ped_table_to_file(
    ped_table = ped_table,
    ped_filename = ped_filename
  )
  testthat::expect_true(file.exists(ped_filename))
  plinkr::save_map_table_to_file(
    map_table = map_table,
    map_filename = map_filename
  )
  testthat::expect_true(file.exists(map_filename))
  plinkr::save_phenotype_table_to_file(
    phenotype_table = phenotype_table,
    phenotype_filename = phenotype_filename
  )
  testthat::expect_true(file.exists(phenotype_filename))

  # PLINK will not do so and will not give an error
  dir.create(
    dirname(qassoc_filename),
    showWarnings = FALSE,
    recursive = TRUE
  )

  args <- c(
    "--map", map_filename,
    "--ped", ped_filename,
    "--pheno", phenotype_filename,
    "--assoc",
    "--maf", maf,
    "--out", output_filename_base
  )
  plinkr::run_plink(
    args = args,
    plink_options = plink_options,
    verbose = verbose
  )

  qassoc_table <- plinkr::read_plink_qassoc_file(qassoc_filename)

  if (verbose) {
    message(paste(plinkr::read_plink_log_file(log_filename), collapse = "\n"))
  }

  file.remove(map_filename)
  file.remove(ped_filename)
  file.remove(phenotype_filename)
  file.remove(qassoc_filename)
  file.remove(log_filename)
  testthat::expect_equal(
    0,
    length(list.files(pattern = base_input_filename))
  )
  unlink(temp_folder, recursive = TRUE)

  qassoc_table
}
