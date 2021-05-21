#' Read a PLINK \code{.qassoc} file
#' @inheritParams default_params_doc
#' @return a tibble
#' @examples
#' read_plink_qassoc_file(
#'   qassoc_filename = get_plinkr_filename("run1.qassoc")
#' )
#' @export
read_plink_qassoc_file <- function(qassoc_filename) {
  testthat::expect_true(file.exists(qassoc_filename))
  text_lines_raw <- readr::read_lines(
    qassoc_filename
  )
  # There is whitespace at start and end
  text_lines <- stringr::str_trim(text_lines_raw)

  text_matrix <- stringr::str_split(
    string = text_lines,
    pattern = "[:blank:]+",
    simplify = TRUE
  )
  t <-  tibble::as_tibble(
    text_matrix[-1, ],
    .name_repair = "minimal"
  )
  names(t) <- text_matrix[1, ]
  t$CHR <- as.numeric(t$CHR)
  t$BP <- as.numeric(t$BP)
  t$NMISS <- as.numeric(t$NMISS)
  t$BETA <- as.numeric(t$BETA)
  t$SE <- as.numeric(t$SE)
  t$R2 <- as.numeric(t$R2)
  t$T <- as.numeric(t$T)
  t$P <- as.numeric(t$P)
  t
}
