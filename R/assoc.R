#' Let \code{PLINK}/\code{PLINK2} detect an association for a binary trait.
#'
#' @note This function is named after the \code{--assoc} flag
#' used by \code{PLINK}
#' @inheritParams default_params_doc
#' @return a \link{list} with the following columns:
#' * \code{assoc_table}: a \link[tibble]{tibble} with associations
#'   found by \code{PLINK}.
#'   See \link{read_plink_assoc_file} for an explanation of the
#'   column names.
#' * \code{log}: the log file as text as created by \code{PLINK}
#' @examples
#' if (is_plink_installed()) {
#'   assoc(create_demo_assoc_params())
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
assoc <- function(
  assoc_params,
  plink_options = create_plink_options(),
  verbose = FALSE
) {
  plinkr::check_assoc_params(assoc_params)
  plinkr::check_plink_options(plink_options)
  if (plink_options$plink_version %in% c("1.7", "1.9")) {
    return(
      plinkr::plink_assoc(
        assoc_params = assoc_params,
        plink_options = plink_options,
        verbose = verbose
      )
    )
  }
  testthat::expect_equal("2.0", plink_options$plink_version)
  plinkr::plink2_assoc(
    assoc_params = assoc_params,
    plink_options = plink_options,
    verbose = verbose
  )
}
