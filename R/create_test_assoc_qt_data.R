#' Create testing data for the \link{assoc_qt} function
#'
#' Create data (as created by \link{create_assoc_qt_data})
#' to detect associations with quantitative traits
#' (using \link{assoc_qt}) used for testing.
#' @inheritParams default_params_doc
#' @examples
#' create_test_assoc_qt_data()
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_assoc_qt_data <- function(
  data = create_test_plink_text_data(),
  phenotype_data = create_phenotype_data_table_from_data(data = data)
) {
  plinkr::check_data(data = data)
  plinkr::check_phenotype_data(phenotype_data)
  phenotype_data$phe_table[, 3] <- 0.1 * seq_len(nrow(phenotype_data$phe_table))
  plinkr::create_assoc_qt_data(
    data = data,
    phenotype_data = phenotype_data
  )
}
