#' Get a simple (\code{.fam}) table
#'
#' Get a simple (\code{.fam}) table,
#' as can be used in testing.
#' @return a (\code{.fam}) table
#' @note The function has the word \code{get} in its name,
#' as getting the result is trivial. When getting the result is non-trivial,
#' the word \code{create} is used.
#' @examples
#' get_test_fam_table()
#' @author Richèl J.C. Bilderbeek
#' @export
get_test_fam_table <- function() {
  fam_table <- plinkr::read_plink_fam_file(get_plinkr_filename("toy_data.fam"))
  if (1 == 2) {
    tibble::tribble(
      ~CHR, ~SNP  , ~position_cm, ~BP, # nolint keep spaces to align content
      1   , "snp1", 0           , 1  , # nolint keep spaces to align content
      1   , "snp2", 0           , 2    # nolint keep spaces to align content
    )
  }
  fam_table
}
