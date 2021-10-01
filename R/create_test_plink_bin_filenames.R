#' Create a set of `plink_bin_filenames` to be used in testing.
#'
#' Create a set of `plink_bin_filenames` to be used in testing.
#' @inheritParams default_params_doc
#' @return a list with the following elements:
#'
#'  * `bed_filename`: the `.bed` filename
#'  * `bim_filename`: the `.bim` filename
#'  * `fam_filename`: the `.fam` filename
#' @seealso Use \link{create_plink_bin_filenames} to creata a set
#' of `PLINK` binary filenames.
#'
#' `plinkr` has the following functions to create sets of filenames,
#' depending on the data:
#'
#'  * `PLINK` text files: use \link{create_plink_text_filenames}
#'  * `PLINK` binary files: use \link{create_plink_bin_filenames}
#'  * `PLINK2` binary files: use \link{create_plink2_bin_filenames}
#'
#' @examples
#' create_test_plink_bin_filenames()
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_plink_bin_filenames <- function(
  bed_filename = "test.bed",
  bim_filename = "test.bim",
  fam_filename = "test.fam"
) {
  plinkr::create_plink_bin_filenames(
    bed_filename = bed_filename,
    bim_filename = bim_filename,
    fam_filename = fam_filename
  )
}
