#' Create the command-line arguments to select samples
#'
#' Create the command-line arguments to select samples.
#' @inheritParams default_params_doc
#' @return the command-line arguments
#' @examples
#' create_select_samples_args(
#'   plink_bin_filenames = create_test_plink_bin_filenames(),
#'   sample_selector = create_test_single_sample_selector()
#' )
#' create_select_samples_args(
#'   plink_bin_filenames = create_plink_bin_filenames(
#'     bed_filename = get_plinkr_filename("select_snps.bed"),
#'     bim_filename = get_plinkr_filename("select_snps.bim"),
#'     fam_filename = get_plinkr_filename("select_snps.fam")
#'   ),
#'   sample_selector = create_test_random_samples_selector()
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
create_select_samples_args <- function(
  plink_bin_filenames,
  sample_selector,
  sample_ids_filename = plinkr::get_plinkr_tempfilename(
    pattern = "sample_ids_", fileext = ".txt"
  ),
  base_output_filename = plinkr::get_plinkr_tempfilename(),
  plink_options = create_plink_options()
) {
  plinkr::check_plink_bin_filenames(plink_bin_filenames)
  plinkr::check_sample_selector(sample_selector)
  plinkr::check_base_output_filename(base_output_filename)
  plinkr::check_sample_ids_filename(sample_ids_filename)
  plinkr::check_plink_options(plink_options)
  if (plinkr::is_single_sample_selector(sample_selector)) {
    return(
      plinkr::create_select_single_sample_args(
        plink_bin_filenames = plink_bin_filenames,
        single_sample_selector = sample_selector,
        sample_ids_filename = sample_ids_filename,
        base_output_filename = base_output_filename,
        plink_options = plink_options
      )
    )
  } else {
    # If this fails, a new sample selector is added
    testthat::expect_true(plinkr::is_random_samples_selector(sample_selector))
    return(
      plinkr::create_select_random_samples_args(
        plink_bin_filenames = plink_bin_filenames,
        random_samples_selector = sample_selector,
        sample_ids_filename = sample_ids_filename,
        base_output_filename = base_output_filename,
        plink_options = plink_options
      )
    )
  }
}
