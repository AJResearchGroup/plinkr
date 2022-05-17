#' Get a simple `.eigenvec` table
#'
#' Get a simple `.eigenvec` table,
#' as can be used in testing.
#' @return a `.eigenvec` table
#' @note The function has the word \code{get} in its name,
#' as getting the result is trivial. When getting the result is non-trivial,
#' the word `create` is used.
#' @examples
#' get_test_eigenvec_table()
#' @author Richèl J.C. Bilderbeek
#' @export
get_test_eigenvec_table <- function() {
  plinkr::read_plink_eigenvec_file(
    eigenvec_filename = get_plinkr_filename("pca.eigenvec")
  )
}
