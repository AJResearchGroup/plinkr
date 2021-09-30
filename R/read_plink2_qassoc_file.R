#' Read a `PLINK2` \link{assoc_qt} file
#' @inheritParams default_params_doc
#' @return a tibble
#' @examples
#' read_plink2_qassoc_file(
#'   qassoc_filename = get_plinkr_filename("run1.qassoc")
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
read_plink2_qassoc_file <- function(
  qassoc_filename
) {
  if (!file.exists(qassoc_filename)) {
    stop(".qassoc file with path '", qassoc_filename, "' not found")
  }
  t <- readr::read_tsv(
    qassoc_filename,
    col_types = readr::cols(
      `#CHROM` = readr::col_double(),
      POS = readr::col_double(),
      ID = readr::col_character(),
      REF = readr::col_character(),
      ALT = readr::col_character(),
      A1 = readr::col_character(),
      TEST = readr::col_character(),
      OBS_CT = readr::col_double(),
      BETA = readr::col_double(),
      SE = readr::col_double(),
      T_STAT = readr::col_double(),
      P = readr::col_double()
    )
  )
  names(t) <- c("CHROM", names(t)[-1])
  t
}
