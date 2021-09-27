#' Read a PLINK \code{.frq.strat} file
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} with column names:
#'   * \code{CHR} ?
#'   * \code{SNP} ?
#'   * \code{CLST} ?
#'   * \code{A1} ?
#'   * \code{A2} ?
#'   * \code{MAF} ?
#'   * \code{MAC} ?
#'   * \code{NCHROBS} ?
#'
#' These column names are the names used by \code{PLINK}.
#' @examples
#' frq_strat_filename <- get_plinkr_filename("miss_stat.frq.strat")
#' read_plink_frq_strat_file(frq_strat_filename)
#' @author Richèl J.C. Bilderbeek
#' @export
read_plink_frq_strat_file <- function(frq_strat_filename) {
  # stringi::str_trim **sometimes** gives an 'embedded nul in string' error.
  # This has been reported at https://github.com/gagolews/stringi/issues/458 .
  # Until then, just try multiple times :-)
  # table <- stringr::str_split(
  #   plinkr::safe_str_trim(
  #     readr::read_lines(
  #       file = frq_strat_filename,
  #       skip_empty_rows = TRUE
  #     )
  #   ),
  #   pattern = "[:blank:]+", # nolint, just use ' +' in strsplit
  #   simplify = TRUE
  # )
  table <- plinkr::safe_str_split(
    plinkr::safe_str_trim(
      readr::read_lines(
        file = frq_strat_filename,
        skip_empty_rows = TRUE
      )
    )
  )
  t <- tibble::as_tibble(table[-1, ], .name_repair = "minimal")
  names(t) <- table[1, ]
  expected_names <- c(
    "CHR",
    "SNP",
    "CLST",
    "A1",
    "A2",
    "MAF",
    "MAC",
    "NCHROBS"
  )
  testthat::expect_equal(expected_names, names(t))

  t$CHR <- as.numeric(t$CHR) # nolint use PLINK notation
  t$CLST <- as.numeric(t$CLST) # nolint use PLINK notation
  t$A1 <- as.numeric(t$A1) # nolint use PLINK notation
  t$A2 <- as.numeric(t$A2) # nolint use PLINK notation
  t$MAC <- as.numeric(t$MAC) # nolint use PLINK notation
  t$MAF <- as.numeric(t$MAF) # nolint use PLINK notation
  t$NCHROBS <- as.numeric(t$NCHROBS) # nolint use PLINK notation
  t
}
