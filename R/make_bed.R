#' Convert to binary files
#' @note this function is named after the PLINK \code{--make-bed}
#' parameter flag
#' @inheritParams default_params_doc
#' @return The full names of the created PLINK1 binary files,
#' which are a \code{.bed}, \code{.bim}, \code{.fam}
#' and \code{.log} file.
#' @author Richèl J.C. Bilderbeek
#' @export
make_bed <- function(
  base_input_filename,
  base_output_filename = file.path(dirname(base_input_filename), "output"),
  plink_options = create_plink_v1_9_options(),
  verbose = FALSE
) {
  plinkr::check_base_input_filename(base_input_filename)
  plinkr::check_base_output_filename(base_output_filename)
  plinkr::check_plink_options(plink_options)
  plinkr::check_verbose(verbose)
  if (plink_options$plink_version == "2.0") {
    stop(
      "PLINK2 cannot convert '.map' and '.ped' files. ",
      "Use PLINK v1.7 or v1.9 instead. "
    )
  }
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
