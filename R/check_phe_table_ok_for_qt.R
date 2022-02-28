#' Check if a phenotype table is valid for use in a quantitative trait analysis
#'
#' Check if a phenotype table is valid for use in a quantitative trait analysis.
#' Will \link{stop} if not
#'
#' For a phenotype table to be valid for use in a quantitative trait analysis,
#' in each column, at least 1 value must differ from 0, 1, and 2.
#' This is because `PLINK` will assume a case-control analysis
#' when all values in a column are 0, 1 and 2.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if the \code{phe_table} is invalid for
#' use in a quantitative trait analysis
#' @seealso use \link{check_phe_table} to check if the `phe_table`
#' is valid in general.
#' @examples
#' check_phe_table_ok_for_qt(get_test_phe_table())
#' @author Richèl J.C. Bilderbeek
#' @export
check_phe_table_ok_for_qt <- function(phe_table) {
  plinkr::check_phe_table(phe_table)

  n_phenotypes <- ncol(phe_table) - 2
  col_indices <- seq(from = 2 + 1, to = 2 + n_phenotypes)
  for (col_index in col_indices) {
    trait_values <- as.numeric(t(phe_table[, col_index]))
    if (all(trait_values %in% c(0, 1, 2))) {
      stop(
        "Phenotypic values match case-control values  \n",
        "in column '", names(phe_table)[col_index], "'. \n",
        "PLINK will always treat these valuse as case-control values\n",
        "and do a case-control analysis. \n",
        " \n",
        "If your values really need to be 1.0's and 2.0's, \n",
        "use a different unit (i.e. use 0.1 and 0.2 deci-unit) \n",
        "or add a little random noise, \n"
      )
    }
  }
}
