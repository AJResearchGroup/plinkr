#' Create a trait with no relation between genotype and a phenotype
#' and a known minor allele frequency.
#'
#' Create a trait with no relation between genotype and phenotype
#' and a known minor allele frequency.
#' The phenotypes are random and uniform,
#' as produced by \link[stats]{rnorm}.
#'
#' @inheritParams default_params_doc
#' @examples
#' create_rnorm_trait()
#' create_rnorm_trait(maf = 0.01)
#' @export
#' @author Richèl J.C. Bilderbeek
create_rnorm_trait <- function(
  mafs = 0.25,
  n_snps = 1
) {
  plinkr::create_trait(
    phenotype = "rnorm",
    mafs = mafs,
    n_snps = n_snps,
    calc_phenotype_function = plinkr::calc_random_phenotype_values
  )
}
