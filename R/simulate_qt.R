#' Simulate a quantitative trait
#'
#' @note This function is named after the \code{--simulate-qt} PLINK flag.
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
simulate_qt <- function(
  simulate_qt_params,
  n_individuals,
  temp_sim_filename = get_plinkr_tempfilename(),
  plink_options = create_plink_options(),
  verbose = FALSE
) {
  plinkr::check_plink_options(plink_options)
  # Create input files
  plinkr::save_simulate_qt_params_to_file(
    simulate_qt_params = simulate_qt_params,
    sim_filename = temp_sim_filename
  )
  testthat::expect_true(file.exists(temp_sim_filename))

  # Run PLINK
  args <- c(
    "--simulate-qt", temp_sim_filename,
    "--simulate-n", n_individuals
  )
  plinkr::run_plink(
    args,
    plink_options = plink_options,
    verbose = verbose
  )

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

  file.remove(temp_sim_filename)
  file.remove(log_filename)
  file.remove(simfreq_filename)

  results
}
