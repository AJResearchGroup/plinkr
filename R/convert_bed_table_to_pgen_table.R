#' Convert a `PLINK` `.bed` table to a `PLINK2` `.pgen` table
#'
#' Convert a `PLINK` `.bed` table to a `PLINK2` `.pgen` table
#' @inheritParams default_params_doc
#' @return a `PLINK2` `.pgen` table
#' @author Richèl J.C. Bilderbeek
#' @export
convert_bed_table_to_pgen_table <- function( # nolint indeed a long function name
  bed_table,
  verbose = FALSE
) {
  plinkr::check_bed_table(bed_table)
  # The following pgen_table table ...
  #
  #       1 1
  # rs0  NA 0
  # rs10  0 1
  #
  # must become the following bed_table:
  #
  #    rs0 rs10
  # 1  NA    0
  # 1   0    1
  #
  # Simple, just transpose!
  pgen_table <- t(bed_table)
  attributes(pgen_table)$plinkr_datatype <- "pgen_table"
  pgen_table <- plinkr::check_pgen_table(pgen_table)
}
