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
  fam_table <- tibble::tribble(
    ~fam  ,  ~id  , ~pat, ~mat, ~sex, ~pheno, # nolint keep spaces to align content
    "per0", "per0", "0" , "0" , 2L   , 2.0     , # nolint keep spaces to align content
    "per1", "per1", "0" , "0" , 2L   , 1.0       # nolint keep spaces to align content
  )
  class(fam_table) <- c("spec_tbl_df", "tbl_df", "tbl", "data.frame")
  fam_table
}
