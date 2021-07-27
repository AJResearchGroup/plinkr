#' Check if a \code{.bed} table is valid.
#'
#' Check if a \code{.bed} table is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if the \code{bed_table} is invalid
#' @examples
#' check_bed_table(get_test_bed_table())
#' @author Richèl J.C. Bilderbeek
#' @export
check_bed_table <- function(bed_table) {

  testthat::expect_true("matrix" %in% class(bed_table))
  testthat::expect_true("array" %in% class(bed_table))
  testthat::expect_true(all(bed_table >= 0))
  testthat::expect_true(all(bed_table <= 4))
}
