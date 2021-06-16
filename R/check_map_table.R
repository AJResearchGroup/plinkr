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
  is_too_highs <- map_table$CHR > 95
  chromosome_numbers <- map_table$CHR[is_too_highs]


  if (any(map_table$CHR > 95)) {
    stop(
      "PLINK can handle a maximum of 95 chromosomes. \n",
      "(see https://www.cog-genomics.org/plink/1.9/input#chr_set) \n",
      "Found chromosome numbers with values: ",
        paste0(chromosome_numbers, collapse = ", ")
    )
  }
}
