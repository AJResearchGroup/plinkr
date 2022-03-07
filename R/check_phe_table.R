#' Check if a phenotype table is valid.
#'
#' Check if a phenotype table is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if the \code{phe_table} is invalid
#' @seealso use \link{check_phe_table_ok_for_qt} to check if the `phe_table`
#' is valid for a quantitative trait analysis.
#' @examples
#' check_phe_table(get_test_phe_table())
#' @author Richèl J.C. Bilderbeek
#' @export
check_phe_table <- function(phe_table) {
  testthat::expect_true(tibble::is_tibble(phe_table))
  testthat::expect_true(ncol(phe_table) >= 3)
  # PLINK names, from
  # https://www.cog-genomics.org/plink/1.9/input#pheno
  testthat::expect_equal("FID", names(phe_table)[1])
  testthat::expect_equal("IID", names(phe_table)[2])
}
