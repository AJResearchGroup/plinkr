#' Create parameters for the \link{assoc_qt} function
#'
#' Create parameters to detect associations with quantitative traits
#' (using \link{assoc_qt}).
#' Use \link{create_test_assoc_qt_params}) to create a set of parameters
#' that is used in testing.
#'
#' @note This function is named after the `--assoc` \code{PLINK} flag,
#' where `--assoc` uses phenotypic values to determine if an association
#' is about a binary/case-control trait or a quantitative trait,
#' \link{plinkr} uses functions named \link{assoc} and \link{assoc_qt}.
#' @inheritParams default_params_doc
#' @return the parameters to do a quantitative trait analysis
#' @seealso use \link{create_test_assoc_qt_params} to create `assoc_qt_params`
#' used for testing
#' @examples
#' create_assoc_qt_params()
#' create_assoc_qt_params(maf = 0.01)
#' create_assoc_qt_params(confidence_interval = 0.99)
#' create_assoc_qt_params(allow_no_sex = TRUE)
#' @author Richèl J.C. Bilderbeek
#' @export
create_assoc_qt_params <- function(
  maf = get_lowest_maf(),
  confidence_interval = NA,
  allow_no_sex = FALSE,
  base_input_filename = file.path(get_plinkr_tempfilename(), "assoc_input"),
  base_output_filename = file.path(get_plinkr_tempfilename(), "assoc_output")
) {
  plinkr::check_maf(maf = maf)
  plinkr::check_confidence_interval(confidence_interval = confidence_interval)
  plinkr::check_allow_no_sex(allow_no_sex = allow_no_sex)
  plinkr::check_base_input_filename(base_input_filename = base_input_filename)
  plinkr::check_base_output_filename(base_output_filename)
  assoc_qt_params <- list(
    maf = maf,
    confidence_interval = confidence_interval,
    allow_no_sex = allow_no_sex,
    base_input_filename = base_input_filename,
    base_output_filename = base_output_filename
  )
  assoc_qt_params
}
