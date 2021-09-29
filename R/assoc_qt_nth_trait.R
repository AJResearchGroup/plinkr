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
  n_traits <- ncol(assoc_qt_params$phe_table) - 2
  if (n > n_traits) {
    stop(
      "Cannot associate the nth trait, as it is absent \n",
      "number of traits: ", n_traits, " \n",
      "n: ", n
    )
  }

  plinkr::check_assoc_qt_params(assoc_qt_params)

  # Do not be smart yet
  ped_table <- assoc_qt_params$data$ped_table
  map_table <- assoc_qt_params$data$map_table
  phe_table <- assoc_qt_params$phe_table
  maf <- assoc_qt_params$maf

  # Of the phenotypes, only keep the nth phenotype
  trait_index <- 2 + n
  keep_indices <- c(1, 2, trait_index)
  phe_table <- phe_table[, keep_indices]
  testthat::expect_equal(3, ncol(phe_table))

  # Filenames
  base_input_filename <- assoc_qt_params$base_input_filename
  base_output_filename <- assoc_qt_params$base_output_filename
  ped_filename <- paste0(base_input_filename, ".ped")
  map_filename <- paste0(base_input_filename, ".map")
  phe_filename <- paste0(base_input_filename, ".phe")
  qassoc_filename <- paste0(base_output_filename, ".qassoc")
  log_filename <- paste0(base_output_filename, ".log")

  # 'save_' functions will check for success themselves
  plinkr::save_ped_table(
    ped_table = ped_table,
    ped_filename = ped_filename
  )
  plinkr::save_map_table(
    map_table = map_table,
    map_filename = map_filename
  )
  plinkr::save_phe_table(
    phe_table = phe_table,
    phe_filename = phe_filename
  )

  # PLINK will not do so and will not give an error
  dir.create(
    dirname(qassoc_filename),
    showWarnings = FALSE,
    recursive = TRUE
  )

  args <- c(
    "--map", map_filename,
    "--ped", ped_filename,
    "--pheno", phe_filename,
    "--assoc",
    "--allow-extra-chr",
    "--chr-set", 95,
    "--maf", maf,
    "--out", base_output_filename
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
  file.remove(phe_filename)
  file.remove(qassoc_filename)
  file.remove(log_filename)
  testthat::expect_equal(
    0,
    length(list.files(pattern = base_input_filename))
  )
  unlink(dirname(base_input_filename), recursive = TRUE)
  unlink(dirname(base_output_filename), recursive = TRUE)

  qassoc_table
}
