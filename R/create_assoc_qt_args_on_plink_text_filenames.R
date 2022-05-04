#' Internal function
#'
#' Create the command-line arguments to call `PLINK` or `PLINK2`
#' to do a quantitative trait analysis, when
#' `PLINK` text files are used as data
#' @inheritParams default_params_doc
#' @return the command-line arguments
#' @seealso see \link{create_assoc_qt_args} for all the specialized
#' functions to create the `PLINK`/`PLINK2` command-line arguments
#' @examples
#' assoc_qt_data <- create_assoc_qt_data(
#'   data = create_plink_text_filenames(
#'     map_filename = get_plinkr_filename("demo_assoc_qt.map"),
#'     ped_filename = get_plinkr_filename("demo_assoc_qt.ped")
#'   ),
#'   phenotype_data = create_test_phenotype_data_filename(
#'     phe_filename = get_plinkr_filename("demo_assoc_qt.phe")
#'   )
#' )
#' create_assoc_qt_args_on_plink_text_filenames(
#'   assoc_qt_data = assoc_qt_data,
#'   assoc_qt_params = create_test_assoc_qt_params()
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
create_assoc_qt_args_on_plink_text_filenames <- function( # nolint indeed a long function name
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
    plinkr::is_plink_text_filenames(assoc_qt_data$data)
  )
  testthat::expect_true(
    plink_options$plink_version %in% plinkr::get_plink1_versions()
  )
  args <- c(
    "--map", assoc_qt_data$data$map_filename,
    "--ped", assoc_qt_data$data$ped_filename,
    "--pheno", assoc_qt_data$phenotype_data$phe_filename,
    "--all-pheno",
    "--assoc",
    "--maf", assoc_qt_params$maf,
    "--ci", assoc_qt_params$confidence_interval,
    "--out", assoc_qt_params$base_output_filename
  )
  if (plink_options$plink_version == "1.7") {
    args <- c(args, "--noweb")
  }
  if (plink_options$plink_version == "1.9") {
    args <- c(args, "--allow-extra-chr", "--chr-set", 95)
  }
  if (assoc_qt_params$allow_no_sex) {
    args <- c(args, "--allow-no-sex")
  }
  args
}
