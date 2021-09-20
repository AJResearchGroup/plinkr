#' Determine if the `plink_bin_data` is indeed `PLINK` bin data
#' @inheritParams default_params_doc
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
