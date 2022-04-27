#' Create the command-line arguments to select a single sample
#'
#' Create the command-line arguments to select a single sample
#' @inheritParams default_params_doc
#' @return the command-line arguments
#' @author Richèl J.C. Bilderbeek
#' @export
create_select_single_sample_args <- function(
  plink_bin_filenames,
  single_sample_selector,
  sample_ids_filename,
  base_output_filename,
  plink_options = create_plink_options()
) {
  plinkr::check_single_sample_selector(single_sample_selector)
  bfile <- tools::file_path_sans_ext(plink_bin_filenames$bed_filename)
  testthat::expect_true(base_output_filename != bfile)
  plinkr::create_keep_args(
    bfile = bfile,
    sample_ids_filename = sample_ids_filename,
    base_output_filename = base_output_filename
  )
}
