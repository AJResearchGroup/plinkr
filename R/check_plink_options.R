#' Check if the options to run PLINK are valid.
#'
#' Check if the options to run PLINK are valid.
#' Will \link{stop} if not.
#'
#' Note that this function does not check if PLINK is actually present in
#' that folder, similar to \link{normalizePath}
#' with \code{mustWork} set to \link{FALSE}
#' @inheritParams default_params_doc
#' @return the PLINK options,
#' as can be checked by \link{check_plink_options}
#' @examples
#' check_plink_options(create_plink_options())
#' check_plink_options(create_plink_v1_7_options())
#' check_plink_options(create_plink_v1_9_options())
#' check_plink_options(create_custom_plink_options("custom_plink_path"))
#' @author Richèl J.C. Bilderbeek
#' @export
check_plink_options <- function(
  plink_options
) {
  if (!is.list(plink_options)) {
    stop(
      "'plink_options' must be a list  \n",
      "Actual class: ", class(plink_options), " \n",
      "Tip: use 'plinkr::create_plink_options()'\n"
    )
  }
  testthat::expect_true("plink_version" %in% names(plink_options))
  testthat::expect_true("plink_exe_path" %in% names(plink_options))
  testthat::expect_true("add_noweb" %in% names(plink_options))
  testthat::expect_true("os" %in% names(plink_options))
  plinkr::check_plink_version(plink_options$plink_version)
  plinkr::check_os(plink_options$os)
}
