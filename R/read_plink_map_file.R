#' Read a PLINK \code{.map} file
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} with the following columns:
#'  * \code{CHR}: the chromosome code or contig name
#'  * \code{SNP}: Variant identifier
#'  * \code{position_cm}: Position in morgans or centimorgans.
#'      This value is optional. Zeroes denote it is unused
#'  * \code{BP}: Base-pair coordinat
#'
#' @note The uppercase variable names are chosen to match those used by PLINK,
#' e.g. as can be observed from \link{assoc_qt}.
#'
#' \code{position_cm} is still lowercase as I am unsure how PLINK calls this
#' variable. If you know, please let me know.
#' @author Richèl J.C. Bilderbeek
#' @export
read_plink_map_file <- function(map_filename) {
  testthat::expect_true(file.exists(map_filename))
  # A text file with no header file,
  # and one line per variant with the following 3-4 fields:
  untrimmed_text <- readr::read_lines(
    file = map_filename,
    skip_empty_rows = TRUE
  )
  text <- stringr::str_trim(untrimmed_text)
  table <- stringr::str_split(
    string = text,
    pattern = "[:blank:]+",
    simplify = TRUE
  )
  tibble::tibble(
    CHR = as.numeric(table[, 1]),
    SNP = table[, 2],
    position_cm = as.numeric(table[, 3]),
    BP = as.numeric(table[, 4]),
  )
}
