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
#' check_bed_table(get_test_bed_table())
#' is_bed_table(get_test_bed_table())
#' @author Richèl J.C. Bilderbeek
#' @export
get_test_bed_table <- function(n_snps = 2) {
  bed_table <- matrix(
    data = as.integer(
      sample(c(0, 1, 2), size = n_snps * 2, replace = TRUE)
    ),
    nrow = n_snps,
    ncol = 2,
    byrow = TRUE,
    dimnames = list(paste0("snp", seq(0, n_snps - 1)), c("per0", "per1"))
  )
  bed_table
}
