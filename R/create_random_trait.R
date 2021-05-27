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
  mafs = 0.25
) {
  # mafs is checked by create_trait
  plinkr::create_trait(phenotype = "random", mafs = mafs)
}
