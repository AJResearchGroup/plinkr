#' Read a PLINK \code{.map} file
#'
#' Read a variant information file
#' accompanying a \code{.ped} text pedigree +
#' genotype table.
#'
#'
#' @inheritParams default_params_doc
#' @return a \[tibble]{tibble} with the following columns:
#'  * \code{chromosome_code}: the chromosome code or contig name
#'  * \code{variant_id}: Variant identifier
#'  * \code{position}: Position in morgans or centimorgans.
#'      This value is options. Zeroes denote it is unused
#'  * \code{coordinat}: Base-pair coordinat
#' @export
read_plink_map_file <- function(map_filename) {
  # A text file with no header file,
  # and one line per variant with the following 3-4 fields:
  table <- stringr::str_split(
    string = readr::read_lines(
      file = map_filename,
      skip_empty_rows = TRUE
    ),
    pattern = "[:blank:]",
    simplify = TRUE
  )
  tibble::tibble(
    chromosome_code = as.numeric(table[, 1]),
    variant_id = table[, 2],
    position = as.numeric(table[, 3]),
    coordinat = as.numeric(table[, 4]),
  )
}
