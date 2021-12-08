#' Rename all the family IDs within the data
#' @inheritParams default_params_doc
#' @return the data with renamed family IDs
#' @author Richèl J.C. Bilderbeek
#' @examples
#' # Use PLINK text data
#' data_before <- create_test_plink_text_data()
#' new_fids <- 1 + data_before$ped_table$FID
#' # the .ped table has the new FIDs
#' data_after <- rename_fids(
#'   data = data_before,
#'   fids = new_fids
#' )
#'
#' # Use data used by plink::assoc_qt
#' data_before <- create_test_assoc_qt_data()
#' new_fids <- 1 + data_before$ped_table$FID
#' # the .ped and .phe tables have the new FIDs
#' data_after <- rename_fids(
#'   data = data_before,
#'   fids = new_fids
#' )
#' @export
rename_fids <- function(
  data,
  fids
) {
  plinkr::check_data(data)
  plinkr::check_fids(fids)

  if (plinkr::is_plink_text_data(data)) {
    testthat::expect_equal(length(fids), length(data$ped_table$FID))
    data$ped_table$FID <- fids
    return(data)
  }
  if (plinkr::is_assoc_qt_data(data)) {
    testthat::expect_equal(length(fids), length(data$data$ped_table$FID))
    # The line below mostly protects against 'phenotype_data' consisting
    # of a file name
    testthat::expect_equal(names(data$phenotype_data), "phe_table")
    testthat::expect_equal(length(fids), length(data$phenotype_data$phe_table$FID))
    data$data$ped_table$FID <- fids
    data$phenotype_data$phe_table$FID <- fids
    return(data)
  }
  stop("TODO: unimplemented type of data")
}
