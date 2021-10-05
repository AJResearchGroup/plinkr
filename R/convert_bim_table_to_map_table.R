#' Convert a `PLINK` `.bim` table to a `PLINK` `.map` table
#'
#' Convert a `PLINK` `.bim` table to a `PLINK` `.map` table
#' @inheritParams default_params_doc
#' @return a `PLINK` `.map` table
#' @author Richèl J.C. Bilderbeek
#' @export
convert_bim_table_to_map_table <- function( # nolint indeed a long function name
  bim_table,
  verbose = FALSE
) {
  plinkr::check_bim_table(bim_table)
  map_table <- tibble::tibble(
    CHR = as.character(bim_table$chr),
    SNP = bim_table$id,
    position_cm = bim_table$posg,
    BP = bim_table$pos
  )
  plinkr::check_map_table(map_table)
  map_table
}
