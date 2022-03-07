#' Determine if a `.pvar` table is valid.
#'
#' Determine if a `.pvar` table is valid.
#' @inheritParams default_params_doc
#' @return \link{TRUE} if the table is a valid `.pvar` table
#' @seealso use \link{check_pvar_table} to check if a table
#' is a valid `.pvar` table (i.e. \link{stop} if it is not)
#' @examples
#' is_pvar_table(get_test_pvar_table())
#'
#' is_pvar_table("nonsense")
#' @author Richèl J.C. Bilderbeek
#' @export
is_pvar_table <- function(
  pvar_table,
  verbose = FALSE
) {
  plinkr::check_verbose(verbose)
  result <- FALSE
  tryCatch({
    plinkr::check_pvar_table(pvar_table = pvar_table)
    result <- TRUE
  }, error = function(e) {
    if (verbose) message(e$message)
  }
  )
  result
}
