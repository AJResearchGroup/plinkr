#' Get a simple (\code{.bed}) table
#'
#' Get a simple (\code{.bed}) table,
#' as can be used in testing.
#' @return a (\code{.bed}) table
#' @note The function has the word \code{get} in its name,
#' as getting the result is trivial. When getting the result is non-trivial,
#' the word \code{create} is used.
#' @examples
#' get_test_bed_table()
#' @author Richèl J.C. Bilderbeek
#' @export
get_test_bed_table <- function() {
  bed_table <- plinkr::read_plink_bed_file(
    bed_filename = get_plinkr_filename("toy_data.bed"),
    names_loci = get_test_bim_table()$id,
    names_ind = get_test_fam_table()$id
  )
  if (1 == 2) {
    tibble::tribble(
      ~CHR, ~SNP  , ~position_cm, ~BP, # nolint keep spaces to align content
      1   , "snp1", 0           , 1  , # nolint keep spaces to align content
      1   , "snp2", 0           , 2    # nolint keep spaces to align content
    )
  }
  bed_table
}
