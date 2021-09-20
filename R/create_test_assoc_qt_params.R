#' Create testing parameters for the \link{assoc_qt} function
#'
#' Create parameters (as created by \link{create_assoc_qt_params})
#' to detect associations with quantitative traits
#' (using \link{assoc_qt}) used for testing.
#'
#' @note This function is named after the \code{--assoc} PLINK flag.
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_assoc_qt_params <- function(
  data = create_test_plink_text_data(),
  phe_table = plinkr::create_phe_table_from_data(data = data),
  maf = get_lowest_maf()
) {
  plinkr::check_data(data = data)
  plinkr::check_phe_table(phe_table = phe_table)
  plinkr::check_maf(maf = maf)
  phe_table[, 3] <- 0.1 * seq_len(nrow(phe_table))
  plinkr::create_assoc_qt_params(
    data = data,
    phe_table = phe_table,
    maf = maf
  )
}
