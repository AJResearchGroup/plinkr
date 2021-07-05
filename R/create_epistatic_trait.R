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
#' create_epistatic_trait()
#' create_epistatic_trait(maf = 0.01)
#' create_epistatic_trait(n_snps = 3)
#' create_epistatic_trait(regular_phenotype_value = 3.14)
#' create_epistatic_trait(epistatic_phenotype_value = 2.71)
#' @export
#' @author Richèl J.C. Bilderbeek
create_epistatic_trait <- function(
  mafs = 0.25,
  n_snps = 2,
  regular_phenotype_value = 20.0,
  epistatic_phenotype_value = 21.0
) {
  calc_phenotype_function <- pryr::partial(
    plinkr::calc_epistatic_phenotype_values,
    regular_phenotype_value = regular_phenotype_value,
    epistatic_phenotype_value = epistatic_phenotype_value
  )
  plinkr::create_trait(
    phenotype = "epistatic",
    mafs = mafs,
    n_snps = n_snps,
    calc_phenotype_function = calc_phenotype_function
  )
}
