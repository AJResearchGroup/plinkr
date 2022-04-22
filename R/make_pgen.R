#' Convert to `PLINK2` binary files
#' @note this function is named after the `PLINK` `--make-pgen`
#' parameter flag
#' @inheritParams default_params_doc
#' @return The full names of the created `PLINK2` binary files,
#' which have the following four file extensions:
#'  * `.log`
#'  * `.pgen`
#'  * `.psam`
#'  * `.pvar`
#' @author Richèl J.C. Bilderbeek
#' @export
make_pgen <- function(
  base_input_filename,
  base_output_filename = file.path(dirname(base_input_filename), "output"),
  plink_options = create_plink_v2_0_options(),
  verbose = FALSE
) {
  plinkr::check_plink_is_installed(plink_options = plink_options)
  plinkr::check_base_input_filename(base_input_filename)
  plinkr::check_base_output_filename(base_output_filename)
  plinkr::check_plink_options(plink_options)
  plinkr::check_verbose(verbose)
  if (plink_options$plink_version %in% plinkr::get_plink1_versions()) {
    stop(
      "PLINK cannot convert to PLINK2 binary files. \n",
      "Use PLINK v2.0 instead. \n",
      " \n",
      "Tip: use 'create_plink_v2_0_options()'"
    )
  }
  # PLINK will not do this for the user
  dir.create(
    dirname(base_output_filename),
    showWarnings = FALSE,
    recursive = TRUE
  )
  args <- c(
    "--bfile", base_input_filename,
    "--make-pgen",
    "--out", base_output_filename
  )
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
