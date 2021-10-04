#' Let PLINK detect an association with one binary traits.
#'
#' @note This function is named after the \code{--assoc} flag used by PLINK
#' @inheritParams default_params_doc
#' @return a \link{list} with the following columns:
#' * \code{assoc_table}: a \link[tibble]{tibble} with associations
#'   found by \code{PLINK}.
#'   See \link{read_plink_assoc_file} for an explanation of the
#'   column names.
#' * \code{log}: the log file as text as created by \code{PLINK}
#' @examples
#' if (is_plink_installed()) {
#'   plink_assoc(create_demo_assoc_params())
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
plink_assoc <- function(
  assoc_params,
  plink_options = create_plink_options(),
  verbose = FALSE
) {
  plinkr::check_assoc_params(assoc_params)
  plinkr::check_plink_options(plink_options)
  testthat::expect_true(plink_options$plink_version %in% c("1.7", "1.9"))

  # Filenames
  ped_filename <- paste0(assoc_params$base_input_filename, ".ped")
  map_filename <- paste0(assoc_params$base_input_filename, ".map")
  assoc_filename <- paste0(assoc_params$base_output_filename, ".assoc")
  log_filename <- paste0(assoc_params$base_output_filename, ".log")

  # 'save_' functions will check for success themselves
  plinkr::save_ped_table(
    ped_table = assoc_params$data$ped_table,
    ped_filename = ped_filename
  )
  plinkr::save_map_table(
    map_table = assoc_params$data$map_table,
    map_filename = map_filename
  )

  # PLINK will not do so and will not give an error
  # PLINK2 will suggest to change the out parameter :-)
  dir.create(
    dirname(assoc_params$base_input_filename),
    showWarnings = FALSE,
    recursive = TRUE
  )
  dir.create(
    dirname(assoc_params$base_output_filename),
    showWarnings = FALSE,
    recursive = TRUE
  )
  args <- plinkr::create_assoc_args(
    assoc_params = assoc_params,
    plink_options = plink_options
  )
  plinkr::run_plink(
    args = args,
    plink_options = plink_options,
    verbose = verbose
  )
  testthat::expect_true(file.exists(assoc_filename))
  testthat::expect_true(file.exists(log_filename))
  assoc_results <- list(
    assoc_table = plinkr::read_plink_assoc_file(assoc_filename),
    log = plinkr::read_plink_log_file(log_filename)
  )

  file.remove(map_filename)
  file.remove(ped_filename)
  file.remove(assoc_filename)
  file.remove(log_filename)
  testthat::expect_equal(
    0,
    length(list.files(pattern = assoc_params$base_input_filename))
  )
  unlink(dirname(assoc_params$base_input_filename), recursive = TRUE)
  testthat::expect_equal(
    0,
    length(list.files(pattern = assoc_params$base_output_filename))
  )
  unlink(dirname(assoc_params$base_output_filename), recursive = TRUE)
  assoc_results
}
