#' Checks that the `plink2_bin_filenames` is valid
#'
#' Checks that the `plink2_bin_filenames` is valid.
#' Calls \link{stop} if not
#' @inheritParams default_params_doc
#' @return nothing
#' @seealso `plinkr` has can check the following check sets of filenames,
#' depending on the type of files:
#'
#'  * `PLINK` text files: use \link{check_plink_text_filenames}
#'  * `PLINK` binary files: use \link{check_plink_bin_filenames}
#'  * `PLINK2` binary files: use \link{check_plink2_bin_filenames}
#'
#' @examples
#' check_plink2_bin_filenames(
#'   create_plink2_bin_filenames(
#'     pgen_filename = "file.pgen",
#'     psam_filename = "file.psam",
#'     pvar_filename = "file.pvar"
#'   )
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
check_plink2_bin_filenames <- function(plink2_bin_filenames) {
  testthat::expect_true(is.list(plink2_bin_filenames))
  testthat::expect_true("pgen_filename" %in% names(plink2_bin_filenames))
  testthat::expect_true("psam_filename" %in% names(plink2_bin_filenames))
  testthat::expect_true("pvar_filename" %in% names(plink2_bin_filenames))
  invisible(plink2_bin_filenames)
}
