#' Create data for the \link{assoc} function
#'
#' Create data to detect associations with a binary traits
#' (using \link{assoc}).
#' Use \link{create_test_assoc_data}) to create a dataset
#' that is used in testing.
#'
#' @note This function is named after the \code{--assoc} PLINK flag.
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
create_assoc_data <- function(
  data
) {
  plinkr::check_data(data)
  list(
    data = data
  )
}
