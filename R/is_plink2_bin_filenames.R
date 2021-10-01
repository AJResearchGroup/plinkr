#' Determine if the `plink2_bin_files` is indeed a set of `PLINK2`
#' binary files' names
#' @inheritParams default_params_doc
#' @return \link{TRUE} if the `plink2_bin_files` is indeed a set of `PLINK`
#' binary files' names
#' @seealso `plinkr` has multiple functions to test if a set of files is valid:
#'
#'  * `PLINK` text files: use \link{is_plink_text_filenames}
#'  * `PLINK` binary files: use \link{is_plink_bin_filenames}
#'  * `PLINK2` binary files: use \link{is_plink2_bin_filenames}
#'
#' @examples
#' is_plink2_bin_filenames(create_test_plink2_bin_filenames())
#' @author Richèl J.C. Bilderbeek
#' @export
is_plink2_bin_filenames <- function(
  plink2_bin_filenames,
  verbose = FALSE
) {
  plinkr::check_verbose(verbose)
  result <- FALSE
  tryCatch({
    plinkr::check_plink2_bin_filenames(plink2_bin_filenames = plink2_bin_filenames)
    result <- TRUE
  }, error = function(e) {
      if (verbose) message(e$message)
    }
  )
  result
}
