#' Determine if a `.pvar` table is valid.
#'
#' Determine if a `.pvar` table is valid.
#' @inheritParams default_params_doc
#' @return \link{TRUE} if the table is a valid `.pvar` table
#' @seealso use \link{check_psam_table} to check if a table
#' is a valid `.pvar` table (i.e. \link{stop} if it is not)
#' @examples
#' is_psam_table(get_test_psam_table())
#'
#' is_psam_table("nonsense")
#' @author Richèl J.C. Bilderbeek
#' @export
is_psam_table <- function(
  psam_table,
  verbose = FALSE
) {
  plinkr::check_verbose(verbose)
  result <- FALSE
  tryCatch({
    plinkr::check_psam_table(psam_table = psam_table)
    result <- TRUE
  }, error = function(e) {
    if (verbose) message(e$message)
  }
  )
  result
}
