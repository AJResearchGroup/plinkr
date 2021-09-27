#' Get a simple `.pvar` table
#'
#' Get a simple `.pvar` table,
#' as can be used in testing.
#' This is the same table as can be obtained by reading
#' the plinkr example file called `toy_v1_9_after_make-bed_after_make-pgen.pvar`.
#' @return a `.pvar` table
#' @note The function has the word `get` in its name,
#' as getting the result is trivial. When getting the result is non-trivial,
#' the word `create` is used.
#' @examples
#' get_test_pvar_table()
#' @author Richèl J.C. Bilderbeek
#' @export
get_test_pvar_table <- function() {
  if (1 == 2) {
    pvar_table <- tibble::tibble(
      chr = c("1", "1"),
      id = c("snp0", "snp1"),
      posg = c(0, 0),
      pos = as.integer(c(0, 1)),
      ref = c("A", "A"),
      alt = c("B", "B")
    )
    class(pvar_table) <- c("spec_tbl_df", "tbl_df", "tbl", "data.frame")
    pvar_table
  }
  # TODO: simplify to work without reading a file
  plinkr::read_plink2_pvar_file(
    plinkr::get_plinkr_filename("toy_v1_9_after_make-bed_after_make-pgen.pvar")
  )
}
