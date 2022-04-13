#' Create a trait with no relation between genotype and phenotype
#' and a known minor allele frequency.
#'
#' Create a trait with no relation between genotype and phenotype
#' and a known minor allele frequency.
#' @inheritParams default_params_doc
#' @examples
#' create_random_trait()
#' create_random_trait(maf = 0.01)
#' @export
#' @author Richèl J.C. Bilderbeek
create_random_trait <- function(
  mafs = 0.25,
  n_snps = 1
) {
  plinkr::check_n_snps(n_snps)
  testthat::expect_true(n_snps > 0)
  # mafs and n_snps are checked by create_trait
  plinkr::create_trait(
    phenotype = "random",
    mafs = mafs,
    n_snps = n_snps,
    calc_phenotype_function = plinkr::calc_random_phenotype_values
  )
}
