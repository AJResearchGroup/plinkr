#' Determine if using `base_input_filename` there are `PLINK` text files
#'
#' Determine if using `base_input_filename` there are `PLINK` text files.
#'
#' This is done by searching the `PLINK` text files at:
#'
#'  * `base_input_filename.map`
#'  * `base_input_filename.ped`
#'
#' If both files exist, this function returns TRUE
#' @note
#'  * the `PLINK` text files are not tested for validity
#'  * it is not checked if a log file is present
#' @inheritParams default_params_doc
#' @return TRUE if the `PLINK` text files exist
#' @examples
#' # TRUE on PLINK v1.7 testing text data
#' has_plink_text_files(
#'   tools::file_path_sans_ext(get_plinkr_filename("test_v1_7.map"))
#' )
#' # FALSE on PLINK binary data
#' has_plink_text_files(
#'   tools::file_path_sans_ext(
#'     get_plinkr_filename("test_v1_7_after_make-bed.bed")
#'   )
#' )
#' # FALSE on PLINK2 binary data
#' has_plink_text_files(
#'   tools::file_path_sans_ext(
#'     get_plinkr_filename("toy_v1_9_after_make-bed_after_make-pgen.pgen")
#'   )
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
has_plink_text_files <- function(
  base_input_filename
) {
  map_filename <- paste0(base_input_filename, ".map")
  ped_filename <- paste0(base_input_filename, ".ped")
  file.exists(map_filename) && file.exists(ped_filename)
}
