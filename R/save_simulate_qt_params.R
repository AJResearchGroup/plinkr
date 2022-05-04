#' Save the parameters for a quantitative traits simulation
#' to file
#'
#' @note This function is named after the \code{--simulate-qt} PLINK flag.
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
save_simulate_qt_params <- function( # nolint indeed a long function name
  simulate_qt_params,
  sim_filename
) {
  plinkr::check_simulate_qt_params(simulate_qt_params)
  line <- paste(
    simulate_qt_params, collapse = " "
  )
  dir.create(dirname(sim_filename), showWarnings = FALSE, recursive = TRUE)
  readr::write_lines(x = line, file = sim_filename)
  testthat::expect_true(file.exists(sim_filename))
}
