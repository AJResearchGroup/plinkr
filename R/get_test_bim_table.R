#' Get a simple genetic mapping (\code{.bim}) table
#'
#' Get a simple genetic mapping (\code{.map}) table,
#' as can be used in testing.
#' This is the same table as can be obtained by reading
#' the PLINK v1.7 example file called \code{test.map}.
#' @return a mapping (\code{.map}) table
#' @note The function has the word \code{get} in its name,
#' as getting the result is trivial. When getting the result is non-trivial,
#' the word \code{create} is used.
#' @seealso use \link{create_demo_map_table} to get simulated
#' genetic mapping tables
#' @examples
#' get_test_bim_table()
#' @author Richèl J.C. Bilderbeek
#' @export
get_test_bim_table <- function() {
  bim_table <- tibble::tibble(
    chr = c("1", "1"),
    id = c("snp0", "snp1"),
    posg = c(0, 0),
    pos = as.integer(c(0, 1)),
    ref = c("A", "A"),
    alt = c("B", "B")
  )
  class(bim_table) <- c("spec_tbl_df", "tbl_df", "tbl", "data.frame")
  bim_table
}
