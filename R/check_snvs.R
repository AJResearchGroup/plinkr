#' Check the single nucleotide variations.
#'
#' Check if the single nucleotide variations are valid,
#' will \link{stop} if not
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
check_snvs <- function(snvs) {
  testthat::expect_true(tibble::is_tibble(snvs))
  testthat::expect_equal(0, ncol(snvs) %% 2)
  unique_chars <- unique(c(as.matrix(snvs)))
  testthat::expect_true(length(unique_chars) <= 4)
  testthat::expect_true(all(unique_chars %in% c("A", "C", "G", "T")))
}
