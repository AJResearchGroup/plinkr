#' Create the command-line arguments to select SNPs
#'
#' Create the command-line arguments to select SNPs.
#' @inheritParams default_params_doc
#' @return the command-line arguments
#' @examples
#' create_select_snp_args(
#'   plink_bin_filenames = create_test_plink_bin_filenames(),
#'   snp_selector = create_test_single_snp_selector()
#' )
#' create_select_snp_args(
#'   plink_bin_filenames = create_test_plink_bin_filenames(),
#'   snp_selector = create_test_random_snp_selector()
#' )
#' create_select_snp_args(
#'   plink_bin_filenames = create_test_plink_bin_filenames(),
#'   snp_selector = create_test_snp_range_selector()
#' )
#' create_select_snp_args(
#'   plink_bin_filenames = create_test_plink_bin_filenames(),
#'   snp_selector = create_test_snp_window_selector()
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
create_select_snp_args <- function(
  plink_bin_filenames,
  snp_selector,
  base_output_filename = plinkr::get_plinkr_tempfilename(),
  plink_options = create_plink_options()
) {
  plinkr::check_plink_bin_filenames(plink_bin_filenames)
  plinkr::check_snp_selector(snp_selector)
  plinkr::check_base_output_filename(base_output_filename)
  plinkr::check_plink_options(plink_options)
  if (plinkr::is_single_snp_selector(snp_selector)) {
    return(
      plinkr::create_select_single_snp_args(
        plink_bin_filenames = plink_bin_filenames,
        single_snp_selector = snp_selector,
        base_output_filename = base_output_filename,
        plink_options = plink_options
      )
    )
  } else if (plinkr::is_random_snp_selector(snp_selector)) {
    return(
      plinkr::create_select_random_snp_args(
        plink_bin_filenames = plink_bin_filenames,
        random_snp_selector = snp_selector,
        base_output_filename = base_output_filename,
        plink_options = plink_options
      )
    )
  } else if (plinkr::is_snp_range_selector(snp_selector)) {
    return(
      plinkr::create_select_snp_range_args(
        plink_bin_filenames = plink_bin_filenames,
        snp_range_selector = snp_selector,
        base_output_filename = base_output_filename,
        plink_options = plink_options
      )
    )
  } else {
    # If this fails, a new SNP selector is added
    testthat::expect_true(plinkr::is_snp_window_selector(snp_selector))

    return(
      plinkr::create_select_snp_window_args(
        plink_bin_filenames = plink_bin_filenames,
        snp_window_selector = snp_selector,
        base_output_filename = base_output_filename,
        plink_options = plink_options
      )
    )
  }
}
