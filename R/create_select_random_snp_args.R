#' Create the command-line arguments to select a range SNPs
#'
#' Create the command-line arguments to select a range SNPs.
#' @inheritParams default_params_doc
#' @return the command-line arguments
#' @author Richèl J.C. Bilderbeek
#' @export
create_select_random_snp_args <- function(
  plink_bin_filenames,
  random_snp_selector,
  base_output_filename = plinkr::get_plinkr_tempfilename(),
  plink_options = create_plink_options()
) {
  plinkr::check_plink_bin_filenames(plink_bin_filenames)
  plinkr::check_random_snp_selector(random_snp_selector)
  plinkr::check_base_output_filename(base_output_filename)
  plinkr::check_plink_options(plink_options)
  bfile <- tools::file_path_sans_ext(plink_bin_filenames$bed_filename)
  testthat::expect_true(base_output_filename != bfile)

  testthat::expect_true(random_snp_selector$n_snps > 0)

  bim_filename <- plink_bin_filenames$bim_filename
  testthat::expect_true(file.exists(bim_filename))
  bim_table <- plinkr::read_plink_bim_file(bim_filename)
  n_snps_present <- nrow(bim_table)
  testthat::expect_true(nrow(bim_table) > 0)

  if (n_snps_present < random_snp_selector$n_snps) {
    stop(
      "Must use less random SNPs to select, ",
      "than the number of SNPs to pick from. \n",
      "Number of SNPs to pick from: ", n_snps_present,
        " (i.e. the number of SNPs in the '.bim' table) \n",
      "Number of random SNPs to pick: ", random_snp_selector$n_snps
    )
  }
  snp_indices <- sort(
    sample(
      seq(1, n_snps_present),
      size = random_snp_selector$n_snps,
      replace = FALSE
    )
  )
  snps <- bim_table$id[snp_indices]
  snps_str <- paste0(snps, collapse = ",")
  c(
    "--bfile", bfile,
    "--snps", snps_str,
    "--make-bed",
    "--out", base_output_filename
  )
}
