#' Determine if a `.map` table is valid.
#'
#' Determine if a `.map` table is valid.
#' @inheritParams default_params_doc
#' @return \link{TRUE} if the table is a valid `.map` table
#' @seealso use \link{check_map_table} to check if a table
#' is a valid `.map` table (i.e. \link{stop} if it is not)
#' @examples
#' is_map_table(get_test_map_table())
#' is_map_table(read_plink_map_file(get_plinkr_filename("toy_v1_9.map")))
#'
#' is_map_table("nonsense")
#' @author Richèl J.C. Bilderbeek
#' @export
is_map_table <- function(
  map_table,
  verbose = FALSE
) {
  plinkr::check_verbose(verbose)
  result <- FALSE
  tryCatch({
    plinkr::check_map_table(map_table = map_table)
    result <- TRUE
  }, error = function(e) {
    if (verbose) message(e$message)
  }
  )
  result
}
