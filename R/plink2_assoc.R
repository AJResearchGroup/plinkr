#' Let \code{PLINK2} detect an association with one binary traits.
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
#'   assoc(create_demo_assoc_params())
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
plink2_assoc <- function(
  assoc_params,
  plink_options = create_plink_v2_0_options(),
  verbose = FALSE
) {
  plinkr::check_assoc_params(assoc_params)
  plinkr::check_plink_options(plink_options)

  testthat::expect_true(plink_options$plink_version %in% get_plink2_versions())

  # else, convert to PLINK2 binary format
  testthat::expect_true(plinkr::is_plink2_bin_data(assoc_params$data))


  # Filenames
  pgen_filename <- paste0(assoc_params$base_input_filename, ".pgen")
  psam_filename <- paste0(assoc_params$base_input_filename, ".psam")
  pvar_filename <- paste0(assoc_params$base_input_filename, ".pvar")

  # 'save_' functions will check for success themselves
  stop("Need help of 'pgenlibr' to save a .pgen file")
  plinkr::save_pgen_table_to_file( # need
    pgen_table = assoc_params$data$pgen_table,
    pgen_filename = pgen_filename
  )
  plinkr::save_psam_table_to_file(
    psam_table = assoc_params$data$psam_table,
    psam_filename = psam_filename
  )
  plinkr::save_pvar_table_to_file(
    pvar_table = assoc_params$data$pvar_table,
    pvar_filename = pvar_filename
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
  assoc_table <- plinkr::read_plink_assoc_file(assoc_filename)

  file.remove(map_filename)
  file.remove(ped_filename)
  file.remove(assoc_filename)
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
  assoc_table
}
