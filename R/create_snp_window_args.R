#' Create the command-line arguments to select SNPs
#'
#' Create the command-line arguments to select SNPs.
#' This function has been named after the `--snp` and `--window` flags
#' @inheritParams default_params_doc
#' @return the command-line arguments
#' @author Richèl J.C. Bilderbeek
#' @export
create_snp_window_args <- function(
  plink_bin_filenames,
  snp_window_selector,
  base_output_filename,
  plink_options = create_plink_options()
) {
  plinkr::check_plink_bin_filenames(plink_bin_filenames)
  plinkr::check_snp_window_selector(snp_window_selector)
  plinkr::check_base_output_filename(base_output_filename)
  plinkr::check_plink_options(plink_options)
  bfile <- tools::file_path_sans_ext(plink_bin_filenames$bed_filename)
  testthat::expect_true(base_output_filename != bfile)
  c(
    "--bfile", bfile,
    "--snp", snp_window_selector$snp,
    "--window", snp_window_selector$window_kb,
    "--make-bed",
    "--out", base_output_filename
  )
}
