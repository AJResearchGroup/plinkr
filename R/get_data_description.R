#' Get a description of the data
#'
#' Get a description of the data
#' @inheritParams default_params_doc
#' @examples
#' get_data_description(data = create_test_plink_text_data())
#' get_data_description(data = create_test_plink_bin_data())
#' get_data_description(data = create_test_plink2_bin_data())
#' get_data_description(data = create_test_plink_text_filenames())
#' get_data_description(data = create_test_plink_bin_filenames())
#' get_data_description(data = create_test_plink2_bin_filenames())
#' @author Richèl J.C. Bilderbeek
#' @export
get_data_description <- function(data) {
  plinkr::check_data(data)
  if (plinkr::is_plink_text_data(data)) {
    return("PLINK text data")
  }
  if (plinkr::is_plink_bin_data(data)) {
    return("PLINK binary data")
  }
  if (plinkr::is_plink2_bin_data(data)) {
    return("PLINK2 binary data")
  }
  if (plinkr::is_plink_text_filenames(data)) {
    return("PLINK text filenames")
  }
  if (plinkr::is_plink_bin_filenames(data)) {
    return("PLINK binary filenames")
  }
  testthat::expect_true(plinkr::is_plink2_bin_filenames(data))
  "PLINK2 binary filenames"
}
