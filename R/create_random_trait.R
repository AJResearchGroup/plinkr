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
  maf = 0.25
) {
  create_trait(phenotype = "random", maf = maf)
}
