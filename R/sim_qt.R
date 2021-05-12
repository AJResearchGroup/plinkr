#' Simulate a quantitative trait
#' @inheritParams default_params_doc
#' @export
sim_qt <- function(
  sim_qt_params,
  n_individuals,
  temp_sim_filename
) {
  # Create input files
  plinkr::save_sim_qt_params_to_file(
    sim_qt_params = sim_qt_params,
    sim_filename = temp_sim_filename
  )
  testthat::expect_true(file.exists(temp_sim_filename))

  # Run PLINK
  args <- c(
    "--simulate-qt", temp_sim_filename,
    "--simulate-n", n_individuals,
    "--noweb"
  )
  plinkr::run_plink(args)

  # Parse output
  log_filename <- "plink.log"
  simfreq_filename <- "plink.simfreq"
  testthat::expect_true(file.exists(log_filename))
  testthat::expect_true(file.exists(simfreq_filename))

  results <- list()
  results$log <- plinkr::read_plink_log_file(
    log_filename = log_filename
  )
  results$simfreq <- plinkr::read_plink_simfreq_file(
    simfreq_filename = simfreq_filename
  )
  results
}
