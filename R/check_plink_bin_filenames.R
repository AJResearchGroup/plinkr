#' Checks that the `plink_bin_filenames` is valid
#'
#' Checks that the `plink_bin_filenames` is valid.
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
#' check_plink_bin_filenames(
#'   create_plink_bin_filenames(
#'     bed_filename = "file.bed",
#'     bim_filename = "file.bim",
#'     fam_filename = "file.fam"
#'   )
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
check_plink_bin_filenames <- function(
  plink_bin_filenames
) {
  testthat::expect_true(is.list(plink_bin_filenames))
  testthat::expect_true("bed_filename" %in% names(plink_bin_filenames))
  testthat::expect_true("bim_filename" %in% names(plink_bin_filenames))
  testthat::expect_true("fam_filename" %in% names(plink_bin_filenames))
  invisible(plink_bin_filenames)
}
