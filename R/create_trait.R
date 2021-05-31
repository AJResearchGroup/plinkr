#' Create a trait with a clear genetic architecture and a known
#' minor allele frequency.
#'
#' Create a trait with a clear genetic architecture and a known
#' minor allele frequency.
#'
#' Prefer to use the specialized functions:
#'
#'  * \link{create_additive_trait}
#'  * \link{create_custom_trait}
#'  * \link{create_epistatic_trait}
#'  * \link{create_random_trait}
#'
#' @inheritParams default_params_doc
#' @examples
#' create_trait(phenotype = "random")
#' create_trait(phenotype = "random", maf = 0.01)
#' create_trait(phenotype = "random", n_snps = 2)
#' @export
#' @author Richèl J.C. Bilderbeek
create_trait <- function(
  phenotype,
  mafs = 0.25,
  n_snps = 1,
  calc_phenotype_function = calc_random_phenotype_values
) {
  plinkr::check_phenotypes(phenotype)
  plinkr::check_mafs(mafs)
  list(
    phenotype = phenotype,
    mafs = mafs,
    n_snps = n_snps,
    calc_phenotype_function = calc_phenotype_function
  )
}
