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
  traits = create_demo_traits()
) {
  plinkr::check_n_individuals(n_individuals)
  plinkr::check_traits(traits)

  # traits must be a list of traits
  if (plinkr::is_one_trait(traits)) traits <- list(traits)
  testthat::expect_false(plinkr::is_one_trait(traits))
  plinkr::check_traits(traits)
  n_traits <- length(traits)
  testthat::expect_true(n_traits >= 0)
  ped_table <- plinkr::create_demo_ped_table(
    n_individuals = n_individuals,
    traits = traits
  )
  map_table <- plinkr::create_demo_map_table(
    n_snps = n_traits
  )
  phenotype_table <- create_demo_phenotype_table(
    ped_table = ped_table,
    traits = traits
  )
  plinkr::create_assoc_qt_params(
    ped_table = ped_table,
    map_table = map_table,
    phenotype_table = phenotype_table
  )
}
