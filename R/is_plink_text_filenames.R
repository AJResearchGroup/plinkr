#' Determine if the `plink_text_files` is indeed a set of `PLINK`
#' text files' names
#' @inheritParams default_params_doc
#' @return \link{TRUE} if the `plink_text_files` is indeed a set of `PLINK`
#' text files' names
#' @seealso `plinkr` has multiple functions to test if a set of files is valid:
#'
#'  * `PLINK` text files: use \link{is_plink_text_filenames}
#'  * `PLINK` binary files: use \link{is_plink_bin_filenames}
#'  * `PLINK2` binary files: use \link{is_plink2_bin_filenames}
#'
#' @examples
#' is_plink_text_filenames(create_test_plink_text_filenames())
#' @author Richèl J.C. Bilderbeek
#' @export
is_plink_text_filenames <- function(
  plink_text_filenames,
  verbose = FALSE
) {
  plinkr::check_verbose(verbose)
  result <- FALSE
  tryCatch({
    plinkr::check_plink_text_filenames(
      plink_text_filenames = plink_text_filenames
    )
    result <- TRUE
  }, error = function(e) {
      if (verbose) message(e$message)
    }
  )
  result
}
