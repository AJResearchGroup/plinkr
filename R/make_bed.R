#' Convert to `PLINK` binary files
#'
#' There are two ways to convert to binary files:
#'
#'  * Convert `PLINK` text files to `PLINK` binary files using `PLINK`,
#'    using \link{make_bed_with_plink}
#'  * Convert `PLINK2` binary files to `PLINK` binary files using `PLINK2`
#'    using \link{make_bed_with_plink2}
#'
#' @note this function is named after the `PLINK`/`PLINK2` `--make-bed`
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
  plinkr::check_plink_options(plink_options)
  if (plink_options$plink_version %in% plinkr::get_plink1_versions()) {
    return(
      plinkr::make_bed_with_plink(
        base_input_filename = base_input_filename,
        base_output_filename = base_output_filename,
        plink_options = plink_options,
        verbose = verbose
      )
    )
  }
  testthat::expect_true(
    plink_options$plink_version %in% plinkr::get_plink2_versions()
  )
  plinkr::make_bed_with_plink2(
    base_input_filename = base_input_filename,
    base_output_filename = base_output_filename,
    plink_options = plink_options,
    verbose = verbose
  )
}
