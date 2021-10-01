#' Create a `plink_bin_filenames`
#'
#' Create a `plink_bin_filenames`,
#' which is a list of `PLINK` binary filenames
#' @inheritParams default_params_doc
#' @return a list with the following elements:
#'
#'  * `bed_filename`: the `.bed` filename
#'  * `bim_filename`: the `.bim` filename
#'  * `fam_filename`: the `.fam` filename
#' @seealso `plinkr` has the following functions to create sets of filenames,
#' depending on the data:
#'
#'  * `PLINK` text files: use \link{create_plink_text_filenames}
#'  * `PLINK` binary files: use \link{create_plink_bin_filenames}
#'  * `PLINK2` binary files: use \link{create_plink2_bin_filenames}
#'
#' @examples
#' create_plink_bin_filenames(
#'   bed_filename = "file.bed",
#'   bim_filename = "file.bim",
#'   fam_filename = "file.fam"
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
create_plink_bin_filenames <- function(
  bed_filename,
  bim_filename,
  fam_filename
) {
  plink_bin_filenames <- list(
    bed_filename = bed_filename,
    bim_filename = bim_filename,
    fam_filename = fam_filename
  )
  plinkr::check_plink_bin_filenames(plink_bin_filenames)
  plink_bin_filenames
}
