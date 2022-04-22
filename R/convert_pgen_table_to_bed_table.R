#' Convert a `PLINK2` `.pgen` table to a `PLINK` `.bed` table
#'
#' Convert a `PLINK2` `.pgen` table to a `PLINK` `.bed` table.
#' To do so, simply transpose a `.pgen` table,
#' see \url{https://github.com/chrchang/plink-ng/issues/195}
#' @inheritParams default_params_doc
#' @return a `PLINK` `.bed` table
#' @author Richèl J.C. Bilderbeek
#' @export
convert_pgen_table_to_bed_table <- function( # nolint indeed a long function name
  pgen_table,
  verbose = FALSE
) {
  pgen_table <- plinkr::check_pgen_table(pgen_table)
  # The following pgen_table table ...
  #
  #    rs0 rs10
  # 1  NA    0
  # 1   0    1
  #
  # must become the following bed_table:
  #
  #       1 1
  # rs0  NA 0
  # rs10  0 1
  #
  # Simple, just transpose
  bed_table <- t(pgen_table)

  bed_table
}
