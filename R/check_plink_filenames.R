#' Check if a `plink_filenames` is valid.
#'
#' Check if a `plink_filenames` is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if the `plink_filenames` is invalid
#' @examples
#' check_plink_filenames(create_test_plink_text_filenames())
#' check_plink_filenames(create_test_plink_bin_filenames())
#' check_plink_filenames(create_test_plink2_bin_filenames())
#' @author Richèl J.C. Bilderbeek
#' @export
check_plink_filenames <- function(plink_filenames) {
  if (plinkr::is_plink_text_filenames(plink_filenames) ||
      plinkr::is_plink_bin_filenames(plink_filenames) ||
      plinkr::is_plink2_bin_filenames(plink_filenames)) {
    return(invisible(plink_filenames))
  }
  stop(
    "'plink_filenames' is not a collection of PLINK text files, ",
    "PLINK binary files, nor PLINK2 binary files. \n",
    "plink_filenames: ", plink_filenames
  )
}
