#' Create a set of \code{assoc_qt} parameters
#' to demonstrate PLINKs \code{--assoc_qt} functionality
#'
#' This function creates:
#'  * Individuals that have all combinations of SNPs exactly once,
#'    as created by the \link{create_demo_ped_table} function
#'  * All SNPs that are on different chromosomes
#'    as created by the \link{create_demo_map_table} function
#'  * Traits that follow different genotype to phenotype mapping:
#'    * `control`: a trait that is random
#'    * `additive`: a trait that is perfectly additive.
#'      The trait value is \code{10.0},
#'      where each `T` increases it by 0.5
#'
#' @note This function is named after the \code{--assoc-qt} PLINK flag.
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
create_demo_assoc_qt_params <- function(
  n_individuals = 4,
  phenotypes = get_phenotypes(),
  mafs = rep(0.25, length(phenotypes)),
  maf = get_lowest_maf()
) {
  plinkr::check_n_individuals(n_individuals)
  plinkr::check_phenotypes(phenotypes)
  plinkr::check_maf(maf)
  testthat::expect_equal(length(phenotypes), length(mafs))
  n_snps <- length(phenotypes)
  testthat::expect_true(n_snps >= 0)
  testthat::expect_silent(plinkr::check_phenotypes(phenotypes))
  ped_table <- plinkr::create_demo_ped_table(
    mafs = mafs,
    n_individuals = n_individuals,
    phenotypes = phenotypes
  )
  map_table <- plinkr::create_demo_map_table(n_snps = length(phenotypes))
  phenotype_table <- create_demo_phenotype_table(
    ped_table = ped_table,
    phenotypes = phenotypes
  )
  plinkr::create_assoc_qt_params(
    ped_table = ped_table,
    map_table = map_table,
    phenotype_table = phenotype_table,
    maf = maf
  )
}
