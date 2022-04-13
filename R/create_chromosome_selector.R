#' Create a selector to select all SNPs on a chromosome
#'
#' Create a selector to select all SNPs on a chromosome
#' to be used in, for example, \link{select_snps}
#' @inheritParams default_params_doc
#' @seealso Use \link{create_test_chromosome_selector} to
#' create a single-SNP selector to be used in testing.
#'
#' There are multiple SNP selectors,
#' see \link{create_snp_selector} for an overview
#' @examples
#' create_chromosome_selector(chromosome_number = 1)
#' create_chromosome_selector(chromosome_number = 22)
#' @author Richèl J.C. Bilderbeek
#' @export
create_chromosome_selector <- function(chromosome_number) {
  plinkr::check_chromosome_number(chromosome_number)
  list(
    chromosome_number = chromosome_number
  )
}
