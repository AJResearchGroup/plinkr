#' Create testing data for the \link{assoc} function
#'
#' Create data (as created by \link{create_assoc_data})
#' to detect associations with quantitative traits
#' (using \link{assoc}) used for testing.
#'
#' @note This function is named after the \code{--assoc} PLINK flag.
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_assoc_data <- function(
  data = create_test_plink_text_data()
) {
  plinkr::check_data(data = data)
  plinkr::create_assoc_data(
    data = data
  )
}
