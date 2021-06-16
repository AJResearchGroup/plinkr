#' Check if a genetic mapping \code{.qassoc} table is valid.
#'
#' Check if a genetic mapping \code{.qassoc} table is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if the \code{qassoc_table} is invalid
#' @author Richèl J.C. Bilderbeek
#' @export
check_qassoc_table <- function(qassoc_table) {
  testthat::expect_true(tibble::is_tibble(qassoc_table))
  testthat::expect_equal(9, ncol(qassoc_table))
  testthat::expect_equal("CHR", names(qassoc_table)[1])
  testthat::expect_equal("SNP", names(qassoc_table)[2])
  testthat::expect_equal("BP", names(qassoc_table)[3])
  testthat::expect_equal("NMISS", names(qassoc_table)[4])
  testthat::expect_equal("BETA", names(qassoc_table)[5])
  testthat::expect_equal("SE", names(qassoc_table)[6])
  testthat::expect_equal("R2", names(qassoc_table)[7])
  testthat::expect_equal("T", names(qassoc_table)[8])
  testthat::expect_equal("P", names(qassoc_table)[9])
}
