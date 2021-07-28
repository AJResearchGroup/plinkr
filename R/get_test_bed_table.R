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
  bed_table <- matrix(
    data = as.integer(c(1, 1, 0, 2)),
    nrow = 2,
    ncol = 2,
    byrow = TRUE,
    dimnames = list(c("snp0", "snp1"), c("per0", "per1"))
  )
  bed_table
}
