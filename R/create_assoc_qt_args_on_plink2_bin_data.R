#' Internal function
#'
#' Create the command-line arguments to call `PLINK` or `PLINK2`
#' to do a quantitative trait analysis, when
#' `PLINK2` binary data is used
#' @inheritParams default_params_doc
#' @return the command-line arguments
#' @author Richèl J.C. Bilderbeek
#' @export
create_assoc_qt_args_on_plink2_bin_data <- function( # nolint indeed a long function name
  assoc_qt_data,
  assoc_qt_params,
  plink_options = create_plink_options()
) {
  plinkr::check_assoc_qt_data(assoc_qt_data)
  plinkr::check_assoc_qt_params(assoc_qt_params)
  plinkr::check_plink_options(plink_options)
  plinkr::check_plink_version_and_data_can_work_together(
    data = assoc_qt_data$data,
    plink_options = plink_options
  )
  testthat::expect_true(
    plink_options$plink_version %in% plinkr::get_plink2_versions()
  )
  c(
    "--pfile", assoc_qt_params$base_input_filename,
    "--glm",
    "--pheno", paste0(assoc_qt_params$base_input_filename, ".phe"),
    "--allow-extra-chr",
    "--chr-set", 95,
    "--maf", assoc_qt_params$maf,
    "--ci", assoc_qt_params$confidence_interval,
    "--out", assoc_qt_params$base_output_filename
  )
}
