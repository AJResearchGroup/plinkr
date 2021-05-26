#' Read a PLINK \code{.log} file
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
read_plink_log_file <- function(
  log_filename
) {
  readr::read_lines(file = log_filename)
}
