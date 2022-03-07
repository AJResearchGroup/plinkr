#' Determine if a `.bim` table is valid.
#'
#' Determine if a `.bim` table is valid.
#' @inheritParams default_params_doc
#' @return \link{TRUE} if the table is a valid `.bim` table
#' @seealso use \link{check_bim_table} to check if a table
#' is a valid `.bim` table (i.e. \link{stop} if it is not)
#' @examples
#' is_bim_table(get_test_bim_table())
#' is_bim_table("nonsense")
#' @author Richèl J.C. Bilderbeek
#' @export
is_bim_table <- function(
  bim_table,
  verbose = FALSE
) {
  plinkr::check_verbose(verbose)
  result <- FALSE
  tryCatch({
    plinkr::check_bim_table(bim_table = bim_table)
    result <- TRUE
  }, error = function(e) {
    if (verbose) message(e$message)
  }
  )
  result
}
