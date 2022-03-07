#' Determine if a `.pgen` table is valid.
#'
#' Determine if a `.pgen` table is valid.
#' @inheritParams default_params_doc
#' @return \link{TRUE} if the table is a valid `.pgen` table
#' @seealso use \link{check_pgen_table} to check if a table
#' is a valid `.pgen` table (i.e. \link{stop} if it is not)
#' @examples
#' is_pgen_table(get_test_pgen_table())
#'
#' is_pgen_table("nonsense")
#' @author Richèl J.C. Bilderbeek
#' @export
is_pgen_table <- function(
  pgen_table,
  verbose = FALSE
) {
  plinkr::check_verbose(verbose)
  result <- FALSE
  tryCatch({
    plinkr::check_pgen_table(pgen_table = pgen_table)
    result <- TRUE
  }, error = function(e) {
    if (verbose) message(e$message)
  }
  )
  result
}
