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
#' create_additive_trait(maf = 0.01)
#' @export
#' @author Richèl J.C. Bilderbeek
create_additive_trait <- function(
  mafs = 0.25
) {
  create_trait(phenotype = "additive", mafs = mafs)
}
