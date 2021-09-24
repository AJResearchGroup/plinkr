#' Read a `PLINK2` `.pvar` file
#' @note this function is inspired by
#' \url{https://github.com/simingz/ctwas/blob/main/R/ctwas_read_data.R#L62}
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
 read_plink2_pvar_file <- function(
  pvar_filename
) {
   testthat::expect_true(file.exists(pvar_filename))
   df <- data.table::fread(pvar_filename, skip = "#CHROM")
   names(df) <- c("CHROM", names(df)[-1])
   pvar_table <- tibble::tibble(df)
   pvar_table
}
