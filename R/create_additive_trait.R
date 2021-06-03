#' Create a trait in which the phenotype is additive
#' and the minor allele frequency is known.
#'
#' Create a trait in which the phenotype is additive
#' and the minor allele frequency is known.
#' The phenotype is fully and perfectly determined by the genotype,
#' see \link{calc_additive_phenotype_values} for the exact phenotypic values
#' @inheritParams default_params_doc
#' @examples
#' create_additive_trait()
#' create_additive_trait(mafs = 0.01)
#' create_additive_trait(n_snps = 2)
#' create_additive_trait(base_phenotype_value = 3.14)
#' create_additive_trait(phenotype_increase = 2.71)
#' @export
#' @author Richèl J.C. Bilderbeek
create_additive_trait <- function(
  mafs = 0.25,
  n_snps = 1,
  base_phenotype_value = 10.0,
  phenotype_increase = 0.5
) {
  calc_phenotype_function <- pryr::partial(
    plinkr::calc_additive_phenotype_values,
    base_phenotype_value = base_phenotype_value,
    phenotype_increase = phenotype_increase
  )

  plinkr::create_trait(
    phenotype = "additive",
    mafs = mafs,
    n_snps = n_snps,
    calc_phenotype_function = calc_phenotype_function
  )
}
