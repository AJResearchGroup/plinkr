#' Get a simple `.pvar` table
#'
#' Get a simple `.pvar` table,
#' as can be used in testing.
#' This is the same table as can be obtained by reading
#' the plinkr example file called
#' `toy_v1_9_after_make-bed_after_make-pgen.pvar`.
#' @return a `.pvar` table
#' @note The function has the word `get` in its name,
#' as getting the result is trivial. When getting the result is non-trivial,
#' the word `create` is used.
#' @examples
#' get_test_pvar_table()
#' @author Richèl J.C. Bilderbeek
#' @export
get_test_pvar_table <- function() {

  pvar_table <- tibble::tribble(
    ~CHROM, ~POS, ~ID,    ~REF, ~ALT, # nolint PLINK2 variable names
    1,      1000, "rs0",  "C",  ".",
    1,      1001, "rs10", "A",  "G"
  )
  pvar_table$CHROM <- as.integer(pvar_table$CHROM)
  pvar_table$POS <- as.integer(pvar_table$POS)
  pvar_table
}
