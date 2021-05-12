#' Read a PLINK log file
#' @inheritParams default_params_doc
#' @export
read_plink_log_file <- function(
  log_filename
) {
  readr::read_lines(file = log_filename)
}
