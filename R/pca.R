#' Do a principal component analysis
#'
#' @note this function is named after the `PLINK`/`PLINK2` `--pca`
#' parameter flag
#' @inheritParams default_params_doc
#' @return a list of filenames that are created.
#'
#' The list has elements:
#'
#'  * `bed_filename`: the `.bed` filename,
#'     as can be read by \link{read_plink_bed_file}
#'  * `bim_filename`: the `.bim` filename,
#'     as can be read by \link{read_plink_bim_file}
#'  * `eigenval_filename`: the `.eigenval` filename,
#'     as can be read by \link{read_plink_eigenval_file}
#'  * `eigenvec_filename`: the `.eigenvec` filename,
#'     as can be read by \link{read_plink_eigenvec_file}
#'  * `fam_filename`: the `.fam` filename,
#'     as can be read by \link{read_plink_fam_file}
#'  * `log_filename`: the `.log` filename,
#'     as can be read by \link{read_plink_log_file}
#' @author Richèl J.C. Bilderbeek
#' @export
pca <- function(
  base_input_filename,
  base_output_filename,
  plink_options = create_plink_v1_9_options(),
  verbose = FALSE
) {
  plinkr::check_base_input_filename(base_input_filename)
  plinkr::check_base_output_filename(base_output_filename)
  plinkr::check_plink_options(plink_options)
  plinkr::check_verbose(verbose)

  bed_filename <- paste0(base_input_filename, ".bed")
  bim_filename <- paste0(base_input_filename, ".bim")
  fam_filename <- paste0(base_input_filename, ".fam")
  testthat::expect_true(file.exists(bed_filename))
  testthat::expect_true(file.exists(bim_filename))
  testthat::expect_true(file.exists(fam_filename))
  args <- plinkr::create_pca_args(
    bfile = base_input_filename,
    base_output_filename = base_output_filename
  )
  dir.create(
    path = dirname(base_output_filename),
    showWarnings = FALSE,
    recursive = TRUE
  )
  plinkr::run_plink(
    args = args,
    plink_options = plink_options,
    verbose = verbose
  )
  filenames <- list()
  filenames$bed_filename <- paste0(base_output_filename, ".bed")
  filenames$bim_filename <- paste0(base_output_filename, ".bim")
  filenames$eigenval_filename <- paste0(base_output_filename, ".eigenval")
  filenames$eigenvec_filename <- paste0(base_output_filename, ".eigenvec")
  filenames$fam_filename <- paste0(base_output_filename, ".fam")
  filenames$log_filename <- paste0(base_output_filename, ".log")
  testthat::expect_true(all(file.exists(as.character(unlist(filenames)))))
  filenames
}
