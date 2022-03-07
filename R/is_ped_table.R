#' Determine if a `.ped` table is valid.
#'
#' Determine if a `.ped` table is valid.
#' @inheritParams default_params_doc
#' @return \link{TRUE} if the table is a valid `.ped` table
#' @seealso use \link{check_ped_table} to check if a table
#' is a valid `.ped` table (i.e. \link{stop} if it is not)
#' @examples
#' is_ped_table(get_test_ped_table())
#' is_ped_table(read_plink_ped_file(get_plinkr_filename("toy_v1_9.ped")))
#'
#' is_ped_table("nonsense")
#' @author Richèl J.C. Bilderbeek
#' @export
is_ped_table <- function(
  ped_table,
  verbose = FALSE
) {
  plinkr::check_verbose(verbose)
  result <- FALSE
  tryCatch({
    plinkr::check_ped_table(ped_table = ped_table)
    result <- TRUE
  }, error = function(e) {
    if (verbose) message(e$message)
  }
  )
  result
}
