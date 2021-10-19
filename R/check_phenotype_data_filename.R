#' Check if the `phenotype_data_filename` is valid.
#'
#' Check if the `phenotype_data_filename` is valid.
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return nothing
#' @author Richèl J.C. Bilderbeek
#' @export
check_phenotype_data_filename <- function(
  phenotype_data_filename
) {
  if (!is.list(phenotype_data_filename)) {
    stop(
      "'phenotype_data_filename' must be a list  \n",
      "Actual class: ", class(phenotype_data_filename), " \n"
    )
  }
  testthat::expect_true("phe_filename" %in% names(phenotype_data_filename))
  testthat::expect_equal(1, length(phenotype_data_filename$phe_filename))
  testthat::expect_true(nchar(phenotype_data_filename$phe_filename) > 0)
  invisible(phenotype_data_filename)
}
