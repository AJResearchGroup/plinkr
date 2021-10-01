#' Convert `PLINK` text files to `PLINK` binary files using `PLINK`
#'
#' @note this function is named after the `PLINK`/`PLINK2` `--make-bed`
#' parameter flag
#' @inheritParams default_params_doc
#' @return The full names of the created `PLINK` binary files,
#' which are a \code{.bed}, \code{.bim}, \code{.fam}
#' and \code{.log} file.
#' @author Richèl J.C. Bilderbeek
#' @export
make_bed_with_plink <- function(
  base_input_filename,
  base_output_filename = file.path(dirname(base_input_filename), "output"),
  plink_options = create_plink_v1_9_options(),
  verbose = FALSE
) {
  plinkr::check_base_input_filename(base_input_filename)
  plinkr::check_base_output_filename(base_output_filename)
  plinkr::check_plink_options(plink_options)
  plinkr::check_verbose(verbose)
  testthat::expect_true(
    plink_options$plink_version %in% plinkr::get_plink1_versions()
  )
  plinkr::check_plink_is_installed(plink_options = plink_options)

  # PLINK will not do this for the user
  dir.create(
    dirname(base_output_filename),
    showWarnings = FALSE,
    recursive = TRUE
  )
  args <- c(
    "--file", base_input_filename,
    "--make-bed",
    "--out", base_output_filename
  )
  if (plink_options$plink_version == "1.7" && sum(args == "--noweb") == 0) {
    args <- c(args, "--noweb")
  }
  plinkr::run_plink(
    args = args,
    plink_options = plink_options,
    verbose = verbose
  )
  list.files(
    path = dirname(base_output_filename),
    pattern = tools::file_path_sans_ext(basename(base_output_filename)),
    full.names = TRUE
  )
}
