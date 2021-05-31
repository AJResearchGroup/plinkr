#' Create a case-control trait with no relation between genotype and phenotype
#' and a known minor allele frequency.
#'
#' Create a case-control  with no relation between genotype and phenotype
#' and a known minor allele frequency.
#' @inheritParams default_params_doc
#' @examples
#' create_random_trait()
#' create_random_trait(maf = 0.01)
#' @export
#' @author Richèl J.C. Bilderbeek
create_random_case_control_trait <- function(
  mafs = 0.25,
  n_snps = 1
) {
  # mafs is checked by create_trait
  plinkr::create_trait(
    phenotype = "random_case_control",
    mafs = mafs,
    n_snps = n_snps,
    calc_phenotype_function = plinkr::calc_random_case_conrol_phenotype_values
  )
}
