#' Let PLINK detect an association with a quantitative trait
#'
#' This function is named after the \code{--assoc} flag used by PLINK
#' @inheritParams default_params_doc
#' @export
assoc_qt <- function(
  assoc_qt_params
) {
  plinkr::check_assoc_qt_params(assoc_qt_params)
  # Do not be smart yet
  ped_table <- assoc_qt_params$ped_table
  map_table <- assoc_qt_params$map_table
  phenotype_table <- assoc_qt_params$phenotype_table
  maf <- assoc_qt_params$maf
  temp_folder <- tempfile()
  base_input_filename <- file.path(temp_folder, "assoc_qt_input")
  output_filename_base <- file.path(temp_folder, "assoc_qt_output")
  ped_filename <- paste0(base_input_filename, ".ped")
  map_filename <- paste0(base_input_filename, ".map")
  phenotype_filename <- paste0(base_input_filename, ".phenotype")
  qassoc_filename <- paste0(output_filename_base, ".qassoc")

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

  plinkr::run_plink(
    args = c(
      "--file", base_input_filename,
      "--assoc",
      "--pheno", phenotype_filename,
      "--maf", maf,
      "--out", output_filename_base
    )
  )
  t <- plinkr::read_plink_qassoc_file(qassoc_filename)
  t$trait_name <- names(assoc_qt_params$phenotype_table[3])

  trait_name <- NULL # nolint suppress 'no visible binding for global variable'
  dplyr::relocate(t, trait_name)
}
