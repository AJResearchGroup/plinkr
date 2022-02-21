#' Check if a `sample_ids` is valid.
#'
#' Check if a `sample_ids` is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if the `sample_ids` is invalid
#' @examples
#' # For PLINK, a .phe table contains the sample IDs
#' phe_table <- get_test_phe_table()
#' sample_ids <- phe_table[, 1:2]
#' check_sample_ids(sample_ids)
#'
#' # For PLINK2, a .psam table contains the sample IDs
#' psam_table <- get_test_psam_table()
#' sample_ids <- psam_table[, 1:2]
#' check_sample_ids(sample_ids)
#' @author Richèl J.C. Bilderbeek
#' @export
check_sample_ids <- function(sample_ids) {
  testthat::expect_true(tibble::is_tibble(sample_ids))
  testthat::expect_true(
    names(sample_ids) == names(get_test_fam_table())[1:2] ||
      names(sample_ids) == names(get_test_psam_table())[1:2]
  )
  invisible(sample_ids)
}
