#' Create the command-line arguments to call PLINK or PLINK2
#' to do a quantitative trait analysis,
#' depending on the type of data.
#' @inheritParams default_params_doc
#' @return the command-line arguments
#' @author Richèl J.C. Bilderbeek
#' @export
create_assoc_qt_args <- function(
  assoc_qt_params,
  plink_options = create_plink_options()
) {
  plinkr::check_assoc_qt_params(assoc_qt_params)
  plinkr::check_plink_options(plink_options)

  if (is_plink_text_data(assoc_qt_params$data)) {
    if (plink_options$plink_version %in% plinkr::get_plink2_versions()) {
      stop(
        "PLINK2 cannot work with PLINK text data. ",
        "Tip 1: use 'plink_options = create_plink_v1_9_options()' ",
        "to the PLINK instead ",
        "Tip 2: use 'convert_plink_text_data_to_plink2_bin_data' ",
        "to convert the data to PLINK2 binary data. "
      )
    }
    return(
      c(
        "--map", paste0(assoc_qt_params$base_input_filename, ".map"),
        "--ped", paste0(assoc_qt_params$base_input_filename, ".ped"),
        "--pheno", paste0(assoc_qt_params$base_input_filename, ".phe"),
        "--all-pheno",
        "--assoc",
        "--allow-extra-chr",
        "--chr-set", 95,
        "--maf", assoc_qt_params$maf,
        "--out", assoc_qt_params$base_output_filename
      )
    )
  }
  if (plinkr::is_plink_bin_data(assoc_qt_params$data)) {
    if (plink_options$plink_version %in% plinkr::get_plink2_versions()) {
      stop(
        "PLINK2 cannot work with PLINK binary data. ",
        "Tip 1: use 'plink_options = create_plink_v1_9_options()' ",
        "to the PLINK instead ",
        "Tip 2: use 'convert_plink_bin_data_to_plink2_bin_data' ",
        "to convert the data to PLINK2 binary data. "
      )
    }

    return(
      c(
        "--bfile", assoc_qt_params$base_input_filename, # PLINK adds prefix # nolint
        # "--bfile", paste0(assoc_qt_params$base_input_filename, ".bed"), # PLINK adds prefix # nolint
        # "--bim", paste0(assoc_qt_params$base_input_filename, ".bim"), # PLINK cannot specify this # nolint
        # "--fam", paste0(assoc_qt_params$base_input_filename, ".fam"), # PLINK cannot specify this # nolint
        "--pheno", paste0(assoc_qt_params$base_input_filename, ".phe"),
        "--all-pheno",
        "--assoc",
        "--allow-extra-chr",
        "--chr-set", 95,
        "--maf", assoc_qt_params$maf,
        "--out", assoc_qt_params$base_output_filename
      )
    )
  }

  testthat::expect_true(plinkr::is_plink2_bin_data(assoc_qt_params$data))
  testthat::expect_true(
    plink_options$plink_version %in% plinkr::get_plink2_versions()
  )
  c(
    "--pfile", assoc_qt_params$base_input_filename,
    "--glm",
    "--allow-extra-chr",
    "--chr-set", 95,
    "--maf", assoc_qt_params$maf,
    "--out", assoc_qt_params$base_output_filename
  )
}
