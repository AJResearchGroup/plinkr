#' Convert a `PLINK2` `.pvar` table to a `PLINK` `.bim` table
#'
#' Convert a `PLINK2` `.pvar` table to a `PLINK` `.bim` table
#' @inheritParams default_params_doc
#' @return a `PLINK` `.bim` table
#' @author Richèl J.C. Bilderbeek
#' @export
convert_pvar_table_to_bim_table <- function( # nolint indeed a long function name
  pvar_table,
  verbose = FALSE
) {
  plinkr::check_pvar_table(pvar_table)
  # CHROM   POS ID    REF   ALT
  # <int> <int> <chr> <chr> <chr>
  #   1  1000 rs0   C     .
  #   1  1001 rs10  A     G
  #
  # with (from https://www.cog-genomics.org/plink/2.0/data):
  #
  #  * POS: Base-pair coordinate (1-based; limited to 231-2)
  #
  # chr   id     posg   pos ref   alt
  # <chr> <chr> <dbl> <int> <chr> <chr>
  #   1     snp0      0     0 A     B
  #   1     snp1      0     1 A     B
  #
  #
  # where (from https://www.cog-genomics.org/plink2/formats#bim):
  #
  #  * posg: Position in morgans or centimorgans (safe to use dummy value of '0')
  #  * pos: Base-pair coordinate (1-based; limited to 231-2)

  bim_table <- tibble::tibble(
    chr = pvar_table$CHROM, # nolint PLINK2 variable name
    id = pvar_table$ID, # nolint PLINK2 variable name
    posg = 0,
    pos = pvar_table$POS, # nolint PLINK2 variable name
    ref = pvar_table$REF, # nolint PLINK2 variable name
    alt = pvar_table$ALT # nolint PLINK2 variable name
  )
  plinkr::check_bim_table(bim_table)
  bim_table
}
