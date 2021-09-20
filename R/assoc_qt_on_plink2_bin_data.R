#' Let PLINK2 detect an association with one or more quantitative traits
#' with data in PLINK2 binary format.
#'
#' Let PLINK2 detect an association with one or more quantitative traits.
#' with data in PLINK2 binary format.
#' @note This function is named after the \code{--assoc} flag used by PLINK.
#' @inheritParams default_params_doc
#' @return
#' A \link[tibble]{tibble} with the detected associations.
#' The table with have as much rows as the number of SNPs multiplied
#' by the number of traits.
#'
#' @author Richèl J.C. Bilderbeek
#' @export
assoc_qt_on_plink2_bin_data <- function(
  assoc_qt_params,
  plink_options = create_plink_options(),
  verbose = FALSE
) {
  plinkr::check_assoc_qt_params(assoc_qt_params)
  plinkr::check_plink_options(plink_options)
  plinkr::check_verbose(verbose)
  if (!plinkr::is_plink2_bin_data(assoc_qt_params)) {
    stop(
      "'assoc_qt_params' is not PLINK2 binary data. \n",
      "Tip 1: use 'assoc_qt' to let plinkr detect the type of PLINK data. \n",
      "Tip 2: If the data is in PLINK text format, ",
      "use 'assoc_qt_on_plink_text_data'. \n",
      "Tip 3: If the data is in PLINK binary format, ",
      "use 'assoc_qt_on_plink_bin_data'. \n",
    )
  }

  NULL
}
