#' Save the parameters for a quantitative traits simulation
#' to file
#' @inheritParams default_params_doc
#' @export
save_sim_qt_params_to_file <- function(
  sim_qt_params,
  sim_filename
) {
  testthat::expect_silent(plinkr::check_sim_qt_params(sim_qt_params))
  line <- paste(
    sim_qt_params, collapse = " "
  )
  readr::write_lines(x = line, file = sim_filename)
  testthat::expect_true(file.exists(sim_filename))
}
