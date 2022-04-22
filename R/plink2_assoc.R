#' Let `PLINK2` detect an association with one binary traits.
#'
#' @note This function is named after the `--assoc` flag used by PLINK
#' @inheritParams default_params_doc
#' @return a \link{list} with the following columns:
#' * `assoc_table`: a \link[tibble]{tibble} with associations
#'   found by `PLINK`.
#'   See \link{read_plink_assoc_file} for an explanation of the
#'   column names.
#' * `log`: the log file as text as created by `PLINK`
#' @examples
#' if (is_plink_installed()) {
#'
#'   if (1 == 2) {
#'     # Need help of 'pgenlibr' to save a .pgen file
#'     plink2_assoc(
#'       assoc_data = create_assoc_data(create_test_plink2_bin_data()),
#'       assoc_params = create_test_assoc_params()
#'     )
#'   }
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
plink2_assoc <- function(
  assoc_data,
  assoc_params,
  plink_options = create_plink_v2_0_options(),
  verbose = FALSE
) {
  plinkr::check_assoc_data(assoc_data)
  plinkr::check_assoc_params(assoc_params)
  plinkr::check_plink_options(plink_options)

  testthat::expect_true(
    plink_options$plink_version %in% plinkr::get_plink2_versions()
  )

  # else, convert to PLINK2 binary format
  if (plinkr::is_plink_text_data(assoc_data$data)) {
    assoc_data$data <- convert_plink_text_data_to_plink2_bin_data(assoc_data$data)
  } else if (plinkr::is_plink_bin_data(assoc_data$data)) {
    assoc_data$data <- convert_plink_bin_data_to_plink2_bin_data(assoc_data$data)
  }
  testthat::expect_true(plinkr::is_plink2_bin_data(assoc_data$data))


  # Filenames
  pgen_filename <- paste0(assoc_params$base_input_filename, ".pgen")
  psam_filename <- paste0(assoc_params$base_input_filename, ".psam")
  pvar_filename <- paste0(assoc_params$base_input_filename, ".pvar")
  assoc_filename <- paste0(assoc_params$base_output_filename, ".assoc")

  # 'save_' functions will check for success themselves
  stop("Need help of 'pgenlibr' to save a .pgen file")
  plinkr::save_pgen_table(
    pgen_table = assoc_data$data$pgen_table,
    pgen_filename = pgen_filename
  )
  plinkr::save_psam_table(
    psam_table = assoc_data$data$psam_table,
    psam_filename = psam_filename
  )
  plinkr::save_pvar_table(
    pvar_table = assoc_data$data$pvar_table,
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

  file.remove(pgen_filename)
  file.remove(psam_filename)
  file.remove(pvar_filename)
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
