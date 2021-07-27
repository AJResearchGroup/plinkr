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
  bim_table <- plinkr::read_plink_bim_file(get_plinkr_filename("toy_data.bim"))
  if (1 == 2) {
    tibble::tribble(
      ~CHR, ~SNP  , ~position_cm, ~BP, # nolint keep spaces to align content
      1   , "snp1", 0           , 1  , # nolint keep spaces to align content
      1   , "snp2", 0           , 2    # nolint keep spaces to align content
    )
  }
  bim_table
}
