#' Internal function
#'
#' Create the command-line arguments to call `PLINK` or `PLINK2`
#' to do a quantitative trait analysis, when
#' `PLINK` binary data is used
#' @inheritParams default_params_doc
#' @return the command-line arguments
#' @seealso see \link{create_assoc_qt_args} for all the specialized
#' functions to create the `PLINK`/`PLINK2` command-line arguments
#' @author Richèl J.C. Bilderbeek
#' @export
create_assoc_qt_args_on_plink2_bin_filenames <- function( # nolint indeed a long function name
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
  testthat::expect_true(plinkr::is_plink2_bin_filenames(assoc_qt_data$data))
  testthat::expect_true(
    plink_options$plink_version %in% plinkr::get_plink2_versions()
  )
  args <- c(
    "--pgen", assoc_qt_data$data$pgen_filename,
    "--psam", assoc_qt_data$data$psam_filename,
    "--pvar", assoc_qt_data$data$pvar_filename,
    "--glm",
    "--pheno", assoc_qt_data$phenotype_data$phe_filename,
    "--allow-extra-chr",
    "--chr-set", 95,
    "--maf", assoc_qt_params$maf,
    "--out", assoc_qt_params$base_output_filename
  )
  if (assoc_qt_params$allow_no_sex) {
    args <- c(args, "--allow-no-sex")
  }
  args
}
