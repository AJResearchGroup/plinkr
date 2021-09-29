#' Check if a \code{.psam} table is valid.
#'
#' Check if a \code{.psam} table is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if the \code{psam_table} is invalid
#' @examples
#' check_psam_table(get_test_psam_table())
#' @author Richèl J.C. Bilderbeek
#' @export
check_psam_table <- function(psam_table) {
  testthat::expect_true(tibble::is_tibble(psam_table))
  testthat::expect_equal(4, ncol(psam_table))
  testthat::expect_equal("FID", names(psam_table)[1])
  testthat::expect_equal("IID", names(psam_table)[2])
  testthat::expect_equal("SEX", names(psam_table)[3])
  testthat::expect_equal("PHENO1", names(psam_table)[4])
  testthat::expect_true(is.character(psam_table$IID))

}
