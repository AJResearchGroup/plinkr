#' Filter `PLINK` and `PLINK2` data on their family ID
#'
#' @note this function is named after the `PLINK`/`PLINK2` `--keep`
#' parameter flag
#' @inheritParams default_params_doc
#' @return the names of the files created
#' @author Richèl J.C. Bilderbeek
#' @export
keep <- function(
  base_input_filename,
  sample_ids_filename,
  base_output_filename,
  plink_options = create_plink_v1_9_options(),
  verbose = FALSE
) {
  plinkr::check_base_input_filename(base_input_filename)
  plinkr::check_sample_ids_filename(sample_ids_filename)
  plinkr::check_base_output_filename(base_output_filename)
  plinkr::check_plink_options(plink_options)
  plinkr::check_verbose(verbose)

  bed_filename <- paste0(base_input_filename, ".bed")
  bim_filename <- paste0(base_input_filename, ".bim")
  fam_filename <- paste0(base_input_filename, ".fam")
  testthat::expect_true(file.exists(bed_filename))
  testthat::expect_true(file.exists(bim_filename))
  testthat::expect_true(file.exists(fam_filename))
  bfile <- tools::file_path_sans_ext(bed_filename)

  # /home/richel/.local/share/plinkr/plink_1_9_unix/plink \
  # --bfile toy_data \
  # --keep sample_ids.txt \
  # --make-bed \
  # --out tmp
  args <- c(
    "--bfile", bfile,
    "--keep", sample_ids_filename,
    "--make-bed",
    "--out", base_output_filename
  )
  plinkr::run_plink(
    args = args,
    plink_options = plink_options,
    verbose = verbose
  )
  plink_bin_filenames <- create_plink_bin_filenames(
    bed_filename = paste0(base_output_filename, ".bed"),
    bim_filename = paste0(base_output_filename, ".bim"),
    fam_filename = paste0(base_output_filename, ".fam")
  )
  plink_bin_filenames$log_filename <- paste0(base_output_filename, ".log")
  testthat::expect_true(file.exists(plink_bin_filenames$bed_filename))
  testthat::expect_true(file.exists(plink_bin_filenames$bim_filename))
  testthat::expect_true(file.exists(plink_bin_filenames$fam_filename))
  testthat::expect_true(file.exists(plink_bin_filenames$log_filename))
  plink_bin_filenames
}
