#' Check if a `.pgen` table is valid.
#'
#' Check if a `.pgen` table is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return a checked `pgen_table`, now of class `pgen_table`
#' @examples
#' check_pgen_table(get_test_pgen_table())
#' @author Richèl J.C. Bilderbeek
#' @export
check_pgen_table <- function(pgen_table) {
  testthat::expect_true(is.matrix(pgen_table))
  testthat::expect_true(has_pgen_table_attributes(pgen_table))
  pgen_table
}
