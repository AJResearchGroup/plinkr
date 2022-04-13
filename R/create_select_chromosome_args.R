#' Create the command-line arguments to select a chromosome
#'
#' Create the command-line arguments to select a chromosome
#' @inheritParams default_params_doc
#' @return the command-line arguments
#' @author Richèl J.C. Bilderbeek
#' @export
create_select_chromosome_args <- function(
  plink_bin_filenames,
  chromosome_selector,
  base_output_filename,
  plink_options = create_plink_options()
) {
  plinkr::check_plink_bin_filenames(plink_bin_filenames)
  plinkr::check_chromosome_selector(chromosome_selector)
  plinkr::check_base_output_filename(base_output_filename)
  plinkr::check_plink_options(plink_options)
  bfile <- tools::file_path_sans_ext(plink_bin_filenames$bed_filename)
  testthat::expect_true(base_output_filename != bfile)
  c(
    "--bfile", bfile,
    "--chr", chromosome_selector$chromosome_number,
    "--make-bed",
    "--out", base_output_filename
  )
}
