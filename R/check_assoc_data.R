#' Check if the `assoc_data` are valid
#'
#' Check if the `assoc_data` are valid, will \link{stop} otherwise
#' @note This function is named after the `--assoc` PLINK flag.
#' @inheritParams default_params_doc
#' @return Nothing.
#' @examples
#' check_assoc_data(create_test_assoc_data())
#' @author Richèl J.C. Bilderbeek
#' @export
check_assoc_data <- function(assoc_data) {
  testthat::expect_true(is.list(assoc_data))
  testthat::expect_true("data" %in% names(assoc_data))
  testthat::expect_silent(plinkr::check_data(assoc_data$data))
  if (!all(
      assoc_data$data$ped_table$case_control_code %in% c(1, 2)
    )
  ) {
    case_control_codes <- assoc_data$data$ped_table$case_control_code
    case_control_codes <- case_control_codes[!case_control_codes %in% c(1, 2)]
    stop(
        "'case_contol_codes' must be 1s and 2s. \n",
        "Found deviating values of: ",
        paste0(case_control_codes, collapse = ", ")
    )
  }
  invisible(assoc_data)
}
