#' Create a `plink2_bin_filenames`
#'
#' Create a `plink2_bin_filenames`,
#' which is a list of `PLINK2` binary filenames
#' @inheritParams default_params_doc
#' @return a list with the following elements:
#'
#'  * `pgen_filename`: the `.pgen` filename
#'  * `psam_filename`: the `.psam` filename
#'  * `pvar_filename`: the `.pvar` filename
#' @seealso `plinkr` has the following functions to create sets of filenames,
#' depending on the data:
#'
#'  * `PLINK` text files: use \link{create_plink_text_filenames}
#'  * `PLINK` binary files: use \link{create_plink_bin_filenames}
#'  * `PLINK2` binary files: use \link{create_plink2_bin_filenames}
#'
#' @examples
#' create_plink2_bin_filenames(
#'   pgen_filename = "file.pgen",
#'   psam_filename = "file.psam",
#'   pvar_filename = "file.pvar"
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
create_plink2_bin_filenames <- function(
  pgen_filename,
  psam_filename,
  pvar_filename
) {
  plink2_bin_filenames <- list(
    pgen_filename = pgen_filename,
    psam_filename = psam_filename,
    pvar_filename = pvar_filename
  )
  plinkr::check_plink2_bin_filenames(plink2_bin_filenames)
  plink2_bin_filenames
}
