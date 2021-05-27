#' Create a trait in which the phenotype is epistatic
#' and the minor allele frequency is known.
#'
#' Create a trait in which the phenotype is epistatic
#' (i.e. determined by multiple SNPs)
#' and the minor allele frequency is known.
#'
#' The phenotype is fully and perfectly determined by the genotype,
#' see \link{calc_epistatic_phenotype_values} for the exact phenotypic values
#' @inheritParams default_params_doc
#' @examples
#' create_additive_trait()
#' create_additive_trait(maf = 0.01)
#' @export
#' @author Richèl J.C. Bilderbeek
create_epistatic_trait <- function(
  mafs = 0.25
) {
  plinkr::create_trait(phenotype = "epistatic", mafs = mafs)
}
