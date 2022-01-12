#' Rename all the within-family IDs within the data
#' @inheritParams default_params_doc
#' @return the data with renamed family IDs
#' @author Richèl J.C. Bilderbeek
#' @examples
#' # Use PLINK text data
#' data_before <- create_test_plink_text_data()
#' new_iids <- as.character(1 + data_before$ped_table$IID)
#' # the .ped table has the new iids
#' data_after <- rename_iids(
#'   data = data_before,
#'   iids = new_iids
#' )
#'
#' # Use data used by plink::assoc_qt
#' data_before <- create_test_assoc_qt_data()
#' new_iids <- as.character(1 + data_before$data$ped_table$IID)
#' # the .ped and .phe tables have the new iids
#' data_after <- rename_iids(
#'   data = data_before,
#'   iids = new_iids
#' )
#' @export
rename_iids <- function(
  data,
  iids
) {
  plinkr::check_data(data)
  plinkr::check_iids(iids)

  if (plinkr::is_plink_text_data(data)) {
    testthat::expect_equal(length(iids), length(data$ped_table$IID))
    data$ped_table$IID <- iids
    return(data)
  }
  if (plinkr::is_assoc_qt_data(data)) {
    testthat::expect_equal(length(iids), length(data$data$ped_table$IID))
    # The line below mostly protects against 'phenotype_data' consisting
    # of a file name
    testthat::expect_equal(names(data$phenotype_data), "phe_table")
    testthat::expect_equal(length(iids), length(data$phenotype_data$phe_table$IID))
    data$data$ped_table$IID <- iids
    data$phenotype_data$phe_table$IID <- iids
    return(data)
  }
  stop("TODO: unimplemented type of data")
}
