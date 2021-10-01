#' Create a `plink2_bin_filenames` to be used in testing.
#'
#' Create a `plink2_bin_filenames` to be used in testing.
#' @inheritParams default_params_doc
#' @return a list with the following elements:
#'
#'  * `pgen_filename`: the `.pgen` filename
#'  * `psam_filename`: the `.psam` filename
#'  * `pvar_filename`: the `.pvar` filename
#' @seealso Use \link{create_plink2_bin_filenames} to creata a set
#' of `PLINK2` binary filenames to be used in testing.
#'
#' `plinkr` has the following functions to create sets of filenames,
#' depending on the data:
#'
#'  * `PLINK` text files: use \link{create_plink_text_filenames}
#'  * `PLINK` binary files: use \link{create_plink_bin_filenames}
#'  * `PLINK2` binary files: use \link{create_plink2_bin_filenames}
#'
#' @examples
#' create_test_plink2_bin_filenames()
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_plink2_bin_filenames <- function(
  pgen_filename = "test.pgen",
  psam_filename = "test.psam",
  pvar_filename = "test.pvar"
) {
  plinkr::create_plink2_bin_filenames(
    pgen_filename = pgen_filename,
    psam_filename = psam_filename,
    pvar_filename = pvar_filename
  )
}
