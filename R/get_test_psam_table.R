#' Get a simple `.psam` table
#'
#' Get a simple `.psam` table,
#' as can be used in testing.
#' This is the same table as can be obtained by reading
#' the plinkr example file called
#' `toy_v1_9_after_make-bed_after_make-pgen.psam`.
#' @return a `.psam` table
#' @note The function has the word `get` in its name,
#' as getting the result is trivial. When getting the result is non-trivial,
#' the word `create` is used.
#' @examples
#' get_test_psam_table()
#'
#' # Same as:
#' plinkr::read_plink2_psam_file(
#'   plinkr::get_plinkr_filename("toy_v1_9_after_make-bed_after_make-pgen.psam")
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
get_test_psam_table <- function() {
  psam_table <- tibble::tribble(
    ~FID, ~IID,         ~SEX, ~PHENO1,
    "1" , "1000000000", 1,    1,
    "1" , "1000000001", 1,    2
  )

  psam_table$SEX <- as.integer(psam_table$SEX)
  psam_table$PHENO1 <- as.integer(psam_table$PHENO1)
  psam_table
}
