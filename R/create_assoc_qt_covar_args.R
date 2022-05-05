#' Create the command-line arguments to call `PLINK` or `PLINK2`
#' to do a quantitative trait analysis with covariates
#' @inheritParams default_params_doc
#' @return the command-line arguments
#' @author Richèl J.C. Bilderbeek
#' @export
create_assoc_qt_covar_args <- function(
  assoc_qt_covar_data,
  assoc_qt_covar_params,
  plink_options = create_plink_options()
) {
  plinkr::check_assoc_qt_covar_data(assoc_qt_covar_data)
  plinkr::check_assoc_qt_covar_params(assoc_qt_covar_params)
  plinkr::check_plink_options(plink_options)
  # Use args without covar
  args <- plinkr::create_assoc_qt_args(
    assoc_qt_data = assoc_qt_covar_data,
    assoc_qt_params =  assoc_qt_covar_params,
    plink_options = plink_options
  )
  # Add unique flags
  args <- c(
    args,
    "--covar", paste0(assoc_qt_covar_params$base_input_filename, ".cov")
  )
  plinkr::check_plink_args(
    args = args,
    plink_options = plink_options
  )
  args
}
