#' Select SNPs
#' @inheritParams default_params_doc
#' @return a `plink_bin_data` (see \link{check_plink_bin_data})
#' @seealso
#'
#' There are multiple SNP selectors:
#'  * a single SNP: see \link{create_single_snp_selector}
#'  * a SNP range: see \link{create_snp_range_selector}
#'  * a window around a SNP: see \link{create_snp_window_selector}
#' @export
#' @examples
#' if (is_plink_installed()) {
#'   # Use PLINK files
#'   plink_bin_filenames <- create_plink_bin_filenames(
#'     bed_filename = get_plinkr_filename("select_snps.bed"),
#'     bim_filename = get_plinkr_filename("select_snps.bim"),
#'     fam_filename = get_plinkr_filename("select_snps.fam")
#'   )
#'   # Selects 3 SNPs, with 'snp_5' in the middle
#'   snp_window_selector <- create_snp_window_selector(
#'     snp = "snp_5",
#'     window_kb = 0.003
#'   )
#'   plink_bin_data <- select_snps(
#'     data = plink_bin_filenames,
#'     snp_selector = snp_window_selector
#'   )
#' }
#' @author Richèl J.C. Bilderbeek
select_snps <- function(
  data,
  snp_selector,
  base_output_filename = plinkr::get_plinkr_tempfilename(),
  plink_options = plinkr::create_plink_options(),
  verbose = FALSE
) {
  plinkr::check_data(data)
  plinkr::check_snp_selector(snp_selector)
  plinkr::check_base_output_filename(base_output_filename)
  plinkr::check_plink_options(plink_options)
  plinkr::check_verbose(verbose)

  if (plinkr::is_plink_bin_filenames(data)) {
    args <- plinkr::create_snp_window_args(
      plink_bin_filenames = data,
      snp_window_selector = snp_selector,
      base_output_filename = base_output_filename,
      plink_options = plink_options
    )
    dir.create(
      dirname(base_output_filename),
      recursive = TRUE,
      showWarnings = FALSE
    )
    plinkr::run_plink(
      args = args,
      plink_options = plink_options,
      verbose = verbose
    )
    new_data <- plinkr::read_plink_bin_data(
      base_input_filename = base_output_filename
    )
    if (verbose) {
      message(
        "Create selected SNPs at files with basename ", base_output_filename
      )
    }
    file.remove(paste0(base_output_filename, ".bed"))
    file.remove(paste0(base_output_filename, ".bim"))
    file.remove(paste0(base_output_filename, ".fam"))
    file.remove(paste0(base_output_filename, ".log"))
    return(new_data)
  } else if (plinkr::is_plink_bin_data(data)) {
    plink_bin_filenames <- plinkr::save_plink_bin_data(
      plink_bin_data = data,
      base_input_filename = base_output_filename
    )
    if (verbose) {
      message(
        "Saved in-memory data to files: \n * ",
        paste0(plink_bin_filenames, collapse = "\n * ")
      )
    }
    base_output_filename_2 <- plinkr::get_plinkr_tempfilename()
    new_data <- plinkr::select_snps(
      data = plink_bin_filenames,
      snp_selector = snp_selector,
      base_output_filename = base_output_filename_2,
      plink_options = plink_options,
      verbose = verbose
    )
    file.remove(unlist(plink_bin_filenames))
    return(new_data)
  } else {
    stop("Unimplemented type of 'data'")
  }
}
