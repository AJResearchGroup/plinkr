#' Create the command-line arguments to select random samples
#'
#' Create the command-line arguments to select random samples
#' @inheritParams default_params_doc
#' @return the command-line arguments
#' @author Richèl J.C. Bilderbeek
#' @export
create_select_random_samples_args <- function( # nolint indeed a long function name
  plink_bin_filenames,
  random_samples_selector,
  sample_ids_filename,
  base_output_filename,
  plink_options = create_plink_options()
) {
  plinkr::check_random_samples_selector(random_samples_selector)
  bfile <- tools::file_path_sans_ext(plink_bin_filenames$bed_filename)
  testthat::expect_true(base_output_filename != bfile)
  plinkr::create_keep_args(
    bfile = bfile,
    sample_ids_filename = sample_ids_filename,
    base_output_filename = base_output_filename
  )
}
