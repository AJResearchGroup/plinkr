#' Create the command-line arguments to call PLINK or PLINK2
#' to do a quantitative trait analysis with covariates
#' @inheritParams default_params_doc
#' @return the command-line arguments
#' @author Richèl J.C. Bilderbeek
#' @export
create_assoc_qt_covar_args <- function(
  assoc_qt_covar_params,
  plink_options = create_plink_options()
) {
  plinkr::check_assoc_qt_covar_params(assoc_qt_covar_params)
  plinkr::check_plink_options(plink_options)
  # Use args without covar
  assoc_qt_args <- plinkr::create_assoc_qt_args(
    assoc_qt_params = assoc_qt_covar_params
  )
  # --out and output base filename must remain last
  first_args <- utils::head(assoc_qt_args, n = -2)
  last_args <- utils::tail(assoc_qt_args, n = 2)

  # Add unique flags
  covar_args <- c(
    "--covar", paste0(assoc_qt_covar_params$base_input_filename, ".cov")
  )
  assoc_qt_covar_args <- c(
    first_args,
    covar_args,
    last_args
  )
  assoc_qt_covar_args
}
