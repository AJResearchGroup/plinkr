#' Create the command-line arguments to select a range SNPs
#'
#' Create the command-line arguments to select a range SNPs.
#' @inheritParams default_params_doc
#' @return the command-line arguments
#' @author Richèl J.C. Bilderbeek
#' @export
create_select_snp_range_args <- function(
  plink_bin_filenames,
  snp_range_selector,
  base_output_filename,
  plink_options = create_plink_options()
) {
  plinkr::check_plink_bin_filenames(plink_bin_filenames)
  plinkr::check_snp_range_selector(snp_range_selector)
  plinkr::check_base_output_filename(base_output_filename)
  plinkr::check_plink_options(plink_options)
  bfile <- tools::file_path_sans_ext(plink_bin_filenames$bed_filename)
  testthat::expect_true(base_output_filename != bfile)
  c(
    "--bfile", bfile,
    "--from", snp_range_selector$snp_from,
    "--to", snp_range_selector$snp_to,
    "--make-bed",
    "--out", base_output_filename
  )
}
