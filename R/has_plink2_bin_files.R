#' Determine if using `base_input_filename` there are `PLINK` binary files
#'
#' Determine if using `base_input_filename` there are `PLINK` binary files.
#'
#' This is done by searching the `PLINK` binary files at:
#'
#'  * `base_input_filename.bed`
#'  * `base_input_filename.bim`
#'  * `base_input_filename.fam`
#'
#' If these files exist, this function returns TRUE
#' @note
#'  * the `PLINK` text files are not tested for validity
#'  * it is not checked if a log file is present
#' @inheritParams default_params_doc
#' @return TRUE if the `PLINK` text files exist
#' @examples
#' # FALSE on PLINK v1.7 testing text data
#' has_plink2_bin_files(
#'   tools::file_path_sans_ext(get_plinkr_filename("test_v1_7.map"))
#' )
#' # FALSE on PLINK binary data
#' has_plink2_bin_files(
#'   tools::file_path_sans_ext(
#'     get_plinkr_filename("test_v1_7_after_make-bed.bed")
#'   )
#' )
#' # TRUE on PLINK2 binary data
#' has_plink2_bin_files(
#'   tools::file_path_sans_ext(
#'     get_plinkr_filename("toy_v1_9_after_make-bed_after_make-pgen.pgen")
#'   )
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
has_plink2_bin_files <- function(
  base_input_filename
) {
  pgen_filename <- paste0(base_input_filename, ".pgen")
  psam_filename <- paste0(base_input_filename, ".psam")
  pvar_filename <- paste0(base_input_filename, ".pvar")
  file.exists(pgen_filename) &&
    file.exists(psam_filename) &&
    file.exists(pvar_filename)
}
