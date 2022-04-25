#' Check if a \code{.fam} table is valid.
#'
#' Check if a \code{.fam} table is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if the \code{fam_table} is invalid
#' @examples
#' check_fam_table(get_test_fam_table())
#' check_fam_table(read_plink_fam_file(get_plinkr_filename("toy_data.fam")))
#' @author Richèl J.C. Bilderbeek
#' @export
check_fam_table <- function(fam_table) {
  testthat::expect_true(tibble::is_tibble(fam_table))
  testthat::expect_equal(6, ncol(fam_table)) # genio expects this
  testthat::expect_equal("fam", names(fam_table)[1])
  testthat::expect_equal("id", names(fam_table)[2])
  testthat::expect_equal("pat", names(fam_table)[3])
  testthat::expect_equal("mat", names(fam_table)[4])
  testthat::expect_equal("sex", names(fam_table)[5])
  testthat::expect_equal("pheno", names(fam_table)[6])
  testthat::expect_true(is.character(fam_table$fam))
  testthat::expect_true(is.character(fam_table$id))
}
