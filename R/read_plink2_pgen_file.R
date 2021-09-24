#' Read a `PLINK2` `.pgen` file
#' @note this function is inspired by
#' \url{https://github.com/simingz/ctwas/blob/main/R/ctwas_read_data.R#L112}
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
 read_plink2_pgen_file <- function(
  pgen_filename,
  verbose = FALSE
) {
   pgen <- pgenlibr::NewPgen(pgen_filename)
   pgen_table <- pgenlibr::ReadList(
     pgen = pgen,
     variant_subset = 1:pgenlibr::GetVariantCt(pgen)
   )
   pgen_table
}
