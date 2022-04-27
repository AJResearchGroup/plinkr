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
  first_col_name <- names(sample_ids)[1]
  testthat::expect_true(first_col_name %in% c("fam", "FID", "fid"))
  second_col_name <- names(sample_ids)[2]
  testthat::expect_true(second_col_name %in% c("id", "IID", "iid"))
  invisible(sample_ids)
}
