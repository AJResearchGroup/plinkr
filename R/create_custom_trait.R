#' Create a custom trait in which the phenotype is
#' determined in a custom way
#' and the minor allele frequency is known.
#'
#' Create a custom trait in which the phenotype is
#' determined in a custom way
#' and the minor allele frequency is known.
#' @inheritParams default_params_doc
#' @examples
#' # Create a custom trait that calculates the phenotypes randomly,
#' # regardless of the genotype.
#' # This is the same as using 'create_random_trait'
#' create_custom_trait(
#'   calc_phenotype_function = calc_random_phenotype_values
#' )
#'
#' # Create a custom trait that calculates the phenotypes additively
#' # This is the same as using 'create_additive_trait'
#' create_custom_trait(
#'   calc_phenotype_function = calc_additive_phenotype_values
#' )
#'
#' # Create a custom trait that calculates the phenotypes from
#' # an epistatic interaction
#' # This is the same as using 'create_epistate_trait'
#' create_custom_trait(
#'   calc_phenotype_function = calc_epistatic_phenotype_values,
#'   n_snps = 2
#' )
#'
#' # Create a custom trait that calculates the phenotypes from
#' # an epistatic interaction
#' # This is the same as using 'create_epistate_trait'
#' create_custom_trait(
#'   calc_phenotype_function = calc_epistatic_phenotype_values,
#'   n_snps = 2
#' )
#'
#' # A trivial trait, that shows the genotypes worked on
#' create_custom_trait(
#'   calc_phenotype_function = function(snvs) {
#'
#'     # Show the input
#'     message(paste0(knitr::kable(snvs), collapse = "\n"))
#'
#'     # Return as much 1s as individuals
#'     rep(1, nrow(snvs))
#'   }
#' )
#'
#' @export
#' @author Richèl J.C. Bilderbeek
create_custom_trait <- function(
  mafs = 0.25,
  n_snps = 1,
  calc_phenotype_function = calc_random_phenotype_values
) {
  plinkr::create_trait(
    phenotype = "custom",
    mafs = mafs,
    n_snps = n_snps,
    calc_phenotype_function = calc_phenotype_function
  )
}
