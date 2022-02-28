#' Check if a phenotype files holds a table that is valid
#' for use in a quantitative trait analysis
#'
#' Check if a phenotype files holds a table that is valid
#' for use in a quantitative trait analysis.
#' Will \link{stop} if not
#'
#' For a phenotype table to be valid for use in a quantitative trait analysis,
#' in each column, at least 1 value must differ from 0, 1, and 2.
#' This is because `PLINK` will assume a case-control analysis
#' when all values in a column are 0, 1 and 2.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if the phenotype table in the file
#' is invalid for use in a quantitative trait analysis
#' @seealso
#' Use \link{check_phe_table_ok_for_qt} to check if an in-memory
#' phenotype table is valid
#' for use in a quantitative trait analysis
#' @examples
#' phe_filename <- get_plinkr_filename("demo_assoc_qt.phe")
#' check_phe_file_ok_for_qt(phe_filename)
#' @author Richèl J.C. Bilderbeek
#' @export
check_phe_file_ok_for_qt <- function(phe_filename) {
  plinkr::check_phe_filename(phe_filename)
  phe_table <- plinkr::read_plink_phe_file(phe_filename)
  plinkr::check_phe_table_ok_for_qt(phe_table)
}
