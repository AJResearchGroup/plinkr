#' Convert a `PLINK2` `.pgen` table to a `PLINK` `.bed` table
#'
#' Convert a `PLINK2` `.pgen` table to a `PLINK` `.bed` table
#' @inheritParams default_params_doc
#' @return a `PLINK` `.bed` table
#' @author Richèl J.C. Bilderbeek
#' @export
convert_pgen_table_to_bed_table <- function( # nolint indeed a long function name
  pgen_table,
  verbose = FALSE
) {
  plinkr::check_pgen_table(pgen_table)
  bed_table <- pgen_table
  plinkr::check_bed_table(bed_table)
  bed_table
}
