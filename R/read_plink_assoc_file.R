#' Read a PLINK \code{.assoc} file
#' @inheritParams default_params_doc
#' @return a tibble
#' @examples
#' read_plink_assoc_file(
#'   assoc_filename = get_plinkr_filename("run1.assoc")
#' )
#' @export
read_plink_assoc_file <- function(assoc_filename) {
  testthat::expect_true(file.exists(assoc_filename))
  text_lines_raw <- readr::read_lines(
    assoc_filename
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
  t
  t$CHR <- as.numeric(t$CHR)
  t$BP <- as.numeric(t$BP)
  t$F_A <- as.numeric(t$F_A)
  t$F_U <- as.numeric(t$F_U)
  t$CHISQ <- as.numeric(t$CHISQ)
  t$P <- as.numeric(t$P)
  t$OR <- as.numeric(t$OR)
  t
}
