#' Save the parameters for a quantitative traits simulation
#' to file
#'
#' @note This function is named after the \code{--simulate-qt} PLINK flag.
#' @inheritParams default_params_doc
#' @export
save_simulate_qt_params_to_file <- function(
  simulate_qt_params,
  sim_filename
) {
  testthat::expect_silent(plinkr::check_simulate_qt_params(simulate_qt_params))
  line <- paste(
    simulate_qt_params, collapse = " "
  )
  readr::write_lines(x = line, file = sim_filename)
  testthat::expect_true(file.exists(sim_filename))
}
