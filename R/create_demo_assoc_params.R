#' Create a set of \code{assoc} parameters
#' to demonstrate PLINKs \code{--assoc} functionality
#'
#' This function creates:
#'  * Individuals that have all combinations of SNPs exactly once,
#'    as created by the \link{create_demo_ped_table} function
#'  * All SNPs that are on different chromosomes
#'    as created by the \link{create_demo_map_table} function
#'  * Traits that follow different genotype to phenotype mapping:
#'    * `control`: a trait that is random
#'    * `additive`: a trait that is perfectly additive,
#'      see \link{calc_additive_phenotype_values} for the exact calculation
#'    * `epistatic`: a trait that is epistatic,
#'      see \link{calc_epistatic_phenotype_values} for the exact calculation
#'
#' @note This function is named after the \code{--assoc} PLINK flag.
#' @examples
#' # Default
#' create_demo_assoc_params()
#'
#' # Add more individuals
#' create_demo_assoc_params(n_individuals = 16)
#'
#' # Use a random trait
#' create_demo_assoc_params(
#'   traits = create_random_trait()
#' )
#'
#' # Use an additive trait
#' create_demo_assoc_params(
#'   traits = create_additive_trait()
#' )
#'
#' # Use an epistatic trait
#' create_demo_assoc_params(
#'   traits = create_epistatic_trait()
#' )
#'
#' # Use an additive and random trait
#' create_demo_assoc_params(
#'   traits = list(create_additive_trait(), create_random_trait())
#' )
#'
#' # Use three random traits
#' create_demo_assoc_params(
#'   traits = rep(list(create_random_trait()), 3)
#' )
#'
#' # Use two additive traits with different minor allele frequencies
#' create_demo_assoc_params(
#'   traits = list(
#'     create_additive_trait(maf = 0.01),
#'     create_additive_trait(maf = 0.10)
#'   )
#' )
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
create_demo_assoc_params <- function(
  n_individuals = 4,
  trait = create_random_trait()
) {
  plinkr::check_n_individuals(n_individuals)
  plinkr::check_trait(trait)

  # traits must be a list of traits
  traits <- list(trait)
  testthat::expect_false(plinkr::is_one_trait(traits))
  plinkr::check_traits(traits)
  n_traits <- length(traits)
  testthat::expect_equal(n_traits, 1)

  ped_table <- plinkr::create_demo_ped_table(
    n_individuals = n_individuals,
    traits = traits
  )
  map_table <- plinkr::create_demo_map_table(
    traits = traits
  )
  phenotype_table <- create_demo_phenotype_table(
    ped_table = ped_table,
    traits = traits
  )
  names(phenotype_table) <- c(names(phenotype_table)[1:2], "case_control_code")
  ped_table$case_control_code <- phenotype_table$case_control_code
  ped_table$case_control_code <- 1 + (ped_table$case_control_code < median(ped_table$case_control_code))
  plinkr::create_assoc_params(
    ped_table = ped_table,
    map_table = map_table
  )
}
