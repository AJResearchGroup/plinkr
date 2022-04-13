#' Create a selector to select all SNPs on a chromosome,
#' to be used in testing
#'
#' Create a selector to select all SNPs on a chromosome,
#' to be used in testing.
#' A SNP selector is used in, for example, \link{select_snps}
#' @inheritParams default_params_doc
#' @return a chromosome selector
#' @seealso Use \link{create_chromosome_selector} to
#' create a regular chromosome selector.
#'
#' There are multiple SNP selectors,
#' see \link{create_snp_selector} for an overview
#' @examples
#' create_test_chromosome_selector()
#'
#' create_test_chromosome_selector(chromosome_number = 22)
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_chromosome_selector <- function(chromosome_number = 1) { # nolint indeed a long function name
  plinkr::create_chromosome_selector(
    chromosome_number = chromosome_number
  )
}
