#' Let `PLINK` detect an association with one or more quantitative traits
#' with files in `PLINK` binary format.
#'
#' Let `PLINK` detect an association with one or more quantitative traits
#' with files in `PLINK` binary format.
#' @inheritParams default_params_doc
#' @return a \link{list} with the following elements:
#'
#'  * `qassoc_filenames`: names of the created association files
#'  * `log_filename`: name of the PLINK log file
#'
#' @seealso use \link{assoc_qt_on_plink_bin_data} to work on data directly
#' @note This function is named after the \code{--assoc} flag used by PLINK.
#' @author Richèl J.C. Bilderbeek
#' @export
assoc_qt_on_plink_bin_files <- function(
  assoc_qt_params,
  plink_options = create_plink_v2_0_options(),
  verbose = FALSE
) {
  stop("TODO Copied from assoc_qt_on_plink2_bin_files")
}
