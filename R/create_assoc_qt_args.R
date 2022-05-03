#' Create the command-line arguments to call `PLINK` or `PLINK2`
#' to do a quantitative trait analysis,
#' depending on the type of data.
#' @inheritParams default_params_doc
#' @return the command-line arguments
#' @examples
#' create_assoc_qt_args(
#'   assoc_qt_data = create_test_assoc_qt_data(),
#'   assoc_qt_params = create_test_assoc_qt_params(),
#'   plink_options = create_plink_options()
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
create_assoc_qt_args <- function(
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

  if (plinkr::is_plink_text_data(assoc_qt_data$data)) {
    return(
      plinkr::create_assoc_qt_args_on_plink_text_data(
        assoc_qt_data = assoc_qt_data,
        assoc_qt_params = assoc_qt_params,
        plink_options = plink_options
      )
    )
  }
  if (plinkr::is_plink_bin_data(assoc_qt_data$data)) {
    return(
      plinkr::create_assoc_qt_args_on_plink_bin_data(
        assoc_qt_data = assoc_qt_data,
        assoc_qt_params = assoc_qt_params,
        plink_options = plink_options
      )
    )
  }
  if (plinkr::is_plink2_bin_data(assoc_qt_data$data)) {
    return(
      plinkr::create_assoc_qt_args_on_plink2_bin_data(
        assoc_qt_data = assoc_qt_data,
        assoc_qt_params = assoc_qt_params,
        plink_options = plink_options
      )
    )
  }
  if (plinkr::is_plink_text_filenames(assoc_qt_data$data)) {
    return(
      plinkr::create_assoc_qt_args_on_plink_text_filenames(
        assoc_qt_data = assoc_qt_data,
        assoc_qt_params = assoc_qt_params,
        plink_options = plink_options
      )
    )
  }
  if (plinkr::is_plink_bin_filenames(assoc_qt_data$data)) {
    return(
      plinkr::create_assoc_qt_args_on_plink_bin_filenames(
        assoc_qt_data = assoc_qt_data,
        assoc_qt_params = assoc_qt_params,
        plink_options = plink_options
      )
    )
  }
  testthat::expect_true(plinkr::is_plink2_bin_filenames(assoc_qt_data$data))
  testthat::expect_true(
    plink_options$plink_version %in% plinkr::get_plink2_versions()
  )
  return(
    c(
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
  )
}
