#' Check if a \code{.bim} table is valid.
#'
#' Check if a \code{.bim} table is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if the \code{bim_table} is invalid
#' @examples
#' check_bim_table(get_test_bim_table())
#' check_bim_table(read_plink_bim_file(get_plinkr_filename("toy_data.bim")))
#' @author Richèl J.C. Bilderbeek
#' @export
check_bim_table <- function(bim_table) {
  testthat::expect_true(tibble::is_tibble(bim_table))
  testthat::expect_equal(6, ncol(bim_table))
  testthat::expect_equal("chr", names(bim_table)[1])
  testthat::expect_equal("id", names(bim_table)[2])
  testthat::expect_equal("posg", names(bim_table)[3])
  testthat::expect_equal("pos", names(bim_table)[4])
  testthat::expect_equal("ref", names(bim_table)[5])
  testthat::expect_equal("alt", names(bim_table)[6])
  is_too_highs <- bim_table$chr > 95
  chromosome_numbers <- bim_table$chr[is_too_highs]
  if (any(bim_table$chr > 95)) {
    stop(
      "plinkr allows a maximum of 95 chromosomes, as \n",
      "default PLINK can handle a maximum of 95 chromosomes. \n",
      "(see https://www.cog-genomics.org/plink/1.9/input#chr_set) \n",
      "Found chromosome numbers with values: ",
      paste0(chromosome_numbers, collapse = ", ")
    )
  }
}
