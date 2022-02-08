#' Checks that the `plink_text_filenames` is valid
#'
#' Checks that the `plink_text_filenames` is valid.
#' Calls \link{stop} if not
#' @inheritParams default_params_doc
#' @return nothing
#' @seealso `plinkr` has the following functions to check sets of filenames,
#' depending on the data:
#'
#'  * `PLINK` text filenames: use \link{check_plink_text_filenames}
#'  * `PLINK` binary filenames: use \link{check_plink_bin_filenames}
#'  * `PLINK2` binary filenames: use \link{check_plink2_bin_filenames}
#'
#' @examples
#' check_plink_text_filenames(
#'   create_plink_text_filenames(
#'     map_filename = "file.map",
#'     ped_filename = "file.ped"
#'   )
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
check_plink_text_filenames <- function(
  plink_text_filenames
) {
  if (!is.list(plink_text_filenames)) {
    stop(
      "'plink_text_filenames' must be a list. \n",
      "class(plink_text_filenames): ", class(plink_text_filenames)
    )
  }
  testthat::expect_true(is.list(plink_text_filenames))
  testthat::expect_true("map_filename" %in% names(plink_text_filenames))
  testthat::expect_true("ped_filename" %in% names(plink_text_filenames))
  invisible(plink_text_filenames)
}
