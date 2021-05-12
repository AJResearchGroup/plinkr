#' Read a PLINK log file
#' @export
read_plink_log_file <- function(
  log_filename
) {
  readr::read_lines(file = log_filename)
}
