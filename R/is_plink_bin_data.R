#' Determine if the `plink_bin_data` is indeed `PLINK` bin data
#' @inheritParams default_params_doc
#' @return \link{TRUE} if the `plink_bin_data` is indeed `PLINK` binary data
#' @seealso `plinkr` has multiple functions to test if a type of data is valid:
#'
#'  * `PLINK` text data: use \link{is_plink_text_data}
#'  * `PLINK` binary data: use \link{is_plink_bin_data}
#'  * `PLINK2` binary data: use \link{is_plink2_bin_data}
#'
#' @examples
#' plink_bin_data <- create_plink_bin_data(
#'   bim_table = get_test_bim_table(),
#'   fam_table = get_test_fam_table(),
#'   bed_table = get_test_bed_table()
#' )
#' is_plink_bin_data(plink_bin_data)
#' @author Richèl J.C. Bilderbeek
#' @export
is_plink_bin_data <- function(
  plink_bin_data,
  verbose = FALSE
) {
  plinkr::check_verbose(verbose)
  result <- FALSE
  tryCatch({
    plinkr::check_plink_bin_data(plink_bin_data = plink_bin_data)
    result <- TRUE
  }, error = function(e) {
      if (verbose) message(e$message)
    }
  )
  result
}
