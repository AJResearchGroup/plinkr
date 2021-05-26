#' Check if a genetic mapping \code{.map} table is valid.
#'
#' Check if a genetic mapping \code{.map} table is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if the \code{map_table} is invalid
#' @author Richèl J.C. Bilderbeek
#' @export
check_map_table <- function(map_table) {
  testthat::expect_true(tibble::is_tibble(map_table))
  testthat::expect_equal(4, ncol(map_table))
  testthat::expect_equal("CHR", names(map_table)[1])
  testthat::expect_equal("SNP", names(map_table)[2])
  testthat::expect_equal("position_cm", names(map_table)[3])
  testthat::expect_equal("BP", names(map_table)[4])
}
