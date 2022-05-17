#' Get a simple `.eigenval` table
#'
#' Get a simple `.eigenval` table,
#' as can be used in testing.
#' @return a `.eigenval` table
#' @note The function has the word \code{get} in its name,
#' as getting the result is trivial. When getting the result is non-trivial,
#' the word `create` is used.
#' @examples
#' get_test_eigenval_table()
#' @author Richèl J.C. Bilderbeek
#' @export
get_test_eigenval_table <- function() {
  plinkr::read_plink_eigenval_file(
    eigenval_filename = get_plinkr_filename("pca.eigenval")
  )
}
