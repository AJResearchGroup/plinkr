#' Check if the PLINK version is valid, will stop if not
#' @inheritParams default_params_doc
#' @export
check_plink_version <- function(plink_version) {
  testthat::expect_true(plink_version %in% c("1.7", "1.9"))
}
