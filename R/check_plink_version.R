#' Check if the PLINK version is valid, will stop if not
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @examples
#' check_plink_version("1.7")
#' check_plink_version("1.9")
#' check_plink_version("custom")
#' @export
check_plink_version <- function(plink_version) {
  testthat::expect_true(plink_version %in% c("1.7", "1.9", "custom"))
}
