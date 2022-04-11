#' Select SNPs
#' @inheritParams default_params_doc
#' @export
#' @author Richèl J.C. Bilderbeek
select_snps <- function(
  data,
  snp_selector,
  base_output_filename = gcaer::get_gcaer_tempfilename()
) {
  plinkr::check_data(data)
  plinkr::check_snp_selector(snp_selector)
  plinkr::check_base_output_filename(base_output_filename)

  if (plinkr::is_plink_bin_filenames(data)) {
    args <- plinkr::create_snps_args(
      plink_bin_filenames = data,
      snp_selector = snp_selector,
      base_output_filename = base_output_filename,
      plink_options = plink_options
    )
    plinkr::run_plink(
      args = args,
      plink_options = plink_options
    )
    new_data <- plinkr::read_plink_bin_data(
      base_input_filename = base_output_filename
    )
    file.remove(paste0(base_output_filename, ".bed"))
    file.remove(paste0(base_output_filename, ".bim"))
    file.remove(paste0(base_output_filename, ".fam"))
    file.remove(paste0(base_output_filename, ".log"))
    return(new_data)
  } else if (plinkr::is_plink_bin_data(data)) {
    plink_bin_filenames <- plinkr::save_plink_bin_data(
      plink_bin_data = data,
      base_input_filename = base_input_filename
    )
    new_data <- gcaer::select_snps(
      data = plink_bin_filenames,
      snp_selector = snp_selector
    )
    file.remove(unlist(plink_bin_filenames))
    return(new_data)
  } else {
    stop("Unimplemented type of 'data'")
  }
}
