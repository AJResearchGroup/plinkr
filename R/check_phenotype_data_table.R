#' Check if the `phenotype_data_table` is valid.
#'
#' Check if the `phenotype_data_table` is valid.
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return nothing
#' @author Richèl J.C. Bilderbeek
#' @export
check_phenotype_data_table <- function(
  phenotype_data_table
) {
  if (!is.list(phenotype_data_table)) {
    stop(
      "'phenotype_data_table' must be a list  \n",
      "Actual class: ", class(phenotype_data_table), " \n",
      "Tip: use 'plinkr::create_plink_options()'\n"
    )
  }
  testthat::expect_true("phe_table" %in% names(phenotype_data_table))
  plinkr::check_phe_table(phenotype_data_table$phe_table)
  invisible(phenotype_data_table)
}
