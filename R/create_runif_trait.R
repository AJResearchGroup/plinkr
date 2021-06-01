#' Create a trait with no relation between genotype and a phenotype
#' and a known minor allele frequency.
#'
#' Create a trait with no relation between genotype and phenotype
#' and a known minor allele frequency.
#' The phenotypes are random and uniform,
#' as produced by \link[stats]{runif}.
#'
#' @inheritParams default_params_doc
#' @examples
#' create_runif_trait()
#' create_runif_trait(maf = 0.01)
#' @export
#' @author Richèl J.C. Bilderbeek
create_runif_trait <- function(
  mafs = 0.25,
  n_snps = 1
) {
  plinkr::create_trait(
    phenotype = "runif",
    mafs = mafs,
    n_snps = n_snps,
    calc_phenotype_function = plinkr::calc_random_phenotype_values
  )
}
