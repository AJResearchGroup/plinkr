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

  # If data, convert to PLINK2 binary format
  if (plinkr::is_plink_text_data(assoc_data$data)) {
    assoc_data$data <- plinkr::convert_plink_text_data_to_plink2_bin_data(
      assoc_data$data
    )
  } else if (plinkr::is_plink_bin_data(assoc_data$data)) {
    assoc_data$data <- plinkr::convert_plink_bin_data_to_plink2_bin_data(
      assoc_data$data
    )
  }
  if (plinkr::is_plink2_bin_data(assoc_data$data)) {
    return(
      plinkr::plink2_assoc_on_plink2_bin_data(
        assoc_data = assoc_data,
        assoc_params = assoc_params,
        plink_options = plink_options,
        verbose = verbose
      )
    )
  }

  testthat::expect_true(plinkr::is_plink2_bin_filenames(assoc_data$data))
  plinkr::plink2_assoc_on_plink2_bin_files(
    assoc_data = assoc_data,
    assoc_params = assoc_params,
    plink_options = plink_options,
    verbose = verbose
  )
}
