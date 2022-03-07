#' Determine if a `.bed` table is valid.
#'
#' Determine if a `.bed` table is valid.
#' @inheritParams default_params_doc
#' @return \link{TRUE} if the table is a valid `.bed` table
#' @seealso use \link{check_bed_table} to check if a table
#' is a valid `.bed` table (i.e. \link{stop} if it is not)
#' @examples
#' is_bed_table(get_test_bed_table())
#' is_bed_table("nonsense")
#' @author Richèl J.C. Bilderbeek
#' @export
is_bed_table <- function(
  bed_table,
  verbose = FALSE
) {
  plinkr::check_verbose(verbose)
  result <- FALSE
  tryCatch({
    plinkr::check_bed_table(bed_table = bed_table)
    result <- TRUE
  }, error = function(e) {
    if (verbose) message(e$message)
  }
  )
  result
}
