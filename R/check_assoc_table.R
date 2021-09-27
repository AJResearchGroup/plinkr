#' Check if a `.assoc` table is valid.
#'
#' Check if a `.assoc` table is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if the `.assoc` is invalid
#' @author Richèl J.C. Bilderbeek
#' @export
check_assoc_table <- function(assoc_table) {
  testthat::expect_true(tibble::is_tibble(assoc_table))
  testthat::expect_equal(10, ncol(assoc_table))
  testthat::expect_equal("CHR", names(assoc_table)[1])
  testthat::expect_equal("SNP", names(assoc_table)[2])
  testthat::expect_equal("BP", names(assoc_table)[3])
  testthat::expect_equal("A1", names(assoc_table)[4])
  testthat::expect_equal("F_A", names(assoc_table)[5])
  testthat::expect_equal("F_U", names(assoc_table)[6])
  testthat::expect_equal("A2", names(assoc_table)[7])
  testthat::expect_equal("CHISQ", names(assoc_table)[8])
  testthat::expect_equal("P", names(assoc_table)[9])
  testthat::expect_equal("OR", names(assoc_table)[10])
}
