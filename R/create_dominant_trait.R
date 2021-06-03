#' Create a trait in which the phenotype is dominant
#' and the minor allele frequency is known.
#'
#' Create a trait in which the phenotype is dominant
#' and the minor allele frequency is known.
#' The phenotype is fully and perfectly determined by the genotype,
#' see \link{calc_dominant_phenotype_values} for the exact phenotypic values
#' @inheritParams default_params_doc
#' @examples
#' create_dominant_trait()
#' create_dominant_trait(maf = 0.01)
#' create_dominant_trait(n_snps = 1)
#' @export
#' @author Richèl J.C. Bilderbeek
create_dominant_trait <- function(
  mafs = 0.25,
  n_snps = 1,
  phenotype_value_recessive = 10.0,
  phenotype_value_dominant = 11.0
) {
  calc_phenotype_function <- pryr::partial(
    plinkr::calc_dominant_phenotype_values,
    phenotype_value_recessive = phenotype_value_recessive,
    phenotype_value_dominant = phenotype_value_dominant
  )
  plinkr::create_trait(
    phenotype = "dominant",
    mafs = mafs,
    n_snps = n_snps,
    calc_phenotype_function = calc_phenotype_function
  )
}
