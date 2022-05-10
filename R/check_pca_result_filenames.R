#' Check if a `pca_result_filenames` is valid.
#'
#' Check if a `pca_result_filenames` is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if the `pca_result_filenames` is invalid
#' @examples
#' check_pca_result_filenames(create_test_pca_result_filenames())
#' @author Richèl J.C. Bilderbeek
#' @export
check_pca_result_filenames <- function(pca_result_filenames) {
  testthat::expect_true(is.list(pca_result_filenames))
  testthat::expect_true("bed_filename" %in% names(pca_result_filenames))
  testthat::expect_true("bim_filename" %in% names(pca_result_filenames))
  testthat::expect_true("eigenval_filename" %in% names(pca_result_filenames))
  testthat::expect_true("eigenvec_filename" %in% names(pca_result_filenames))
  testthat::expect_true("fam_filename" %in% names(pca_result_filenames))
  testthat::expect_true("log_filename" %in% names(pca_result_filenames))
  invisible(pca_result_filenames)
}
