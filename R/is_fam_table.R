#' Determine if a `.fam` table is valid.
#'
#' Determine if a `.fam` table is valid.
#' @inheritParams default_params_doc
#' @return \link{TRUE} if the table is a valid `.fam` table
#' @seealso use \link{check_fam_table} to check if a table
#' is a valid `.fam` table (i.e. \link{stop} if it is not)
#' @examples
#' is_fam_table(get_test_fam_table())
#' is_fam_table(read_plink_fam_file(get_plinkr_filename("toy_v1_9.fam")))
#'
#' is_fam_table("nonsense")
#' @author Richèl J.C. Bilderbeek
#' @export
is_fam_table <- function(
  fam_table,
  verbose = FALSE
) {
  plinkr::check_verbose(verbose)
  result <- FALSE
  tryCatch({
    plinkr::check_fam_table(fam_table = fam_table)
    result <- TRUE
  }, error = function(e) {
    if (verbose) message(e$message)
  }
  )
  result
}
