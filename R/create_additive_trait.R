#' Create a trait in which the phenotype is additive
#' and the minor allele frequency is known.
#'
#' Create a trait in which the phenotype is additive
#' and the minor allele frequency is known.
#' The phenotype is fully and perfectly determined by the genotype
#' @inheritParams default_params_doc
#' @examples
#' create_additive_trait()
#' create_additive_trait(maf = 0.01)
#' @export
#' @author Richèl J.C. Bilderbeek
create_additive_trait <- function(
  maf = 0.25
) {
  create_trait(phenotype = "additive", maf = maf)
}
