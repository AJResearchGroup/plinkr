#' Create the command-line arguments to call PLINK or PLINK2
#' to do a quantitative trait analysis
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
  if (plink_options$plink_version == "1.7") {
    return(
      c(
        "--map", paste0(assoc_qt_params$base_input_filename, ".map"),
        "--ped", paste0(assoc_qt_params$base_input_filename, ".ped"),
        "--pheno", paste0(assoc_qt_params$base_input_filename, ".phenotype"),
        "--all-pheno",
        "--assoc",
        "--allow-extra-chr",
        "--chr-set", 95,
        "--maf", assoc_qt_params$maf,
        "--out", assoc_qt_params$base_output_filename
      )
    )
  }
  if (plink_options$plink_version == "1.9") {
    return(
      c(
        "--map", paste0(assoc_qt_params$base_input_filename, ".map"),
        "--ped", paste0(assoc_qt_params$base_input_filename, ".ped"),
        "--pheno", paste0(assoc_qt_params$base_input_filename, ".phenotype"),
        "--all-pheno",
        "--assoc",
        "--allow-extra-chr",
        "--chr-set", 95,
        "--maf", assoc_qt_params$maf,
        "--out", assoc_qt_params$base_output_filename
      )
    )
  }
  testthat::expect_true(plink_options$plink_version == "2.0")
  c(
    "--map", paste0(assoc_qt_params$base_input_filename, ".map"),
    "--ped", paste0(assoc_qt_params$base_input_filename, ".ped"),
    "--pheno", paste0(assoc_qt_params$base_input_filename, ".phenotype"),
    "--all-pheno",
    "--assoc",
    "--allow-extra-chr",
    "--chr-set", 95,
    "--maf", assoc_qt_params$maf,
    "--out", assoc_qt_params$base_output_filename
  )
}
