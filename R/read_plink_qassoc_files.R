#' Read one or more \code{PLINK} \code{.qassoc} file
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble}
#' @examples
#' read_plink_qassoc_files(
#'   qassoc_filenames = get_plinkr_filename("run1.qassoc")
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
read_plink_qassoc_files <- function(qassoc_filenames) {
  qassocs <- list()
  for (i in seq_along(qassoc_filenames)) {
    qassocs[[i]] <- plinkr::read_plink_qassoc_file(
      qassoc_filenames[i]
    )
  }
  qassoc <- dplyr::bind_rows(qassocs)
  qassoc
}
