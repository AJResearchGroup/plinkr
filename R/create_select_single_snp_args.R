#' Create the command-line arguments to select a single SNP
#'
#' Create the command-line arguments to select a single SNP
#' @inheritParams default_params_doc
#' @return the command-line arguments
#' @author Richèl J.C. Bilderbeek
#' @export
create_select_single_snp_args <- function(
  plink_bin_filenames,
  single_snp_selector,
  base_output_filename,
  plink_options = create_plink_options()
) {
  plinkr::check_single_snp_selector(single_snp_selector)
  snp_window_selector <- plinkr::create_snp_window_selector(
    snp = single_snp_selector$snp,
    window_kb = 0.001
  )
  plinkr::create_select_snp_window_args(
    plink_bin_filenames = plink_bin_filenames,
    snp_window_selector = snp_window_selector,
    base_output_filename = base_output_filename,
    plink_options = plink_options
  )
}
