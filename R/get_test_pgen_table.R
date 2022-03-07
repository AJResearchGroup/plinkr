#' Get a simple `.pgen` table
#'
#' Get a simple `.pgen` table,
#' as can be used in testing.
#' This is the same table as can be obtained by reading
#' the plinkr example file called
#' `toy_v1_9_after_make-bed_after_make-pgen.pgen`.
#' @return a `.pgen` table
#' @note The function has the word `get` in its name,
#' as getting the result is trivial. When getting the result is non-trivial,
#' the word `create` is used.
#' @examples
#' get_test_pgen_table()
#' @author Richèl J.C. Bilderbeek
#' @export
get_test_pgen_table <- function() {
  pgen_table <- array(
    data = c(
      2, 1, 0, 1, 0, 0,
      1, 1, 2, 0, 1, 0
    ),
    dim = c(6, 2)
  )
  colnames(pgen_table) <- paste0("snp", c(1, 2))
  rownames(pgen_table) <- as.character(seq(1, 6))

  my_attributes <- attributes(pgen_table)
  my_attributes$plink_data_type <- "pgen_table"
  attributes(pgen_table) <- my_attributes

  pgen_table
}
