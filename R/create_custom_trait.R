#' Create a custom trait in which the phenotype is
#' determined in a custom way
#' and the minor allele frequency is known.
#'
#' Create a custom trait in which the phenotype is
#' determined in a custom way
#' and the minor allele frequency is known.
#' @inheritParams default_params_doc
#' @examples
#' create_additive_trait()
#' create_additive_trait(maf = 0.01)
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
