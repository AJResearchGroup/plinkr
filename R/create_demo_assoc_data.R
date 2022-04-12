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
#'   trait = create_random_trait()
#' )
#'
#' # Use an additive trait
#' create_demo_assoc_params(
#'   trait = create_additive_trait()
#' )
#'
#' # Use an epistatic trait
#' create_demo_assoc_params(
#'   trait = create_epistatic_trait()
#' )
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
create_demo_assoc_data <- function(
  n_individuals = 3,
  trait = create_random_case_control_trait()
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
  phe_table <- create_demo_phe_table(
    ped_table = ped_table,
    traits = traits
  )
  names(phe_table) <- c(names(phe_table)[1:2], "case_control_code")
  ped_table$case_control_code <- phe_table$case_control_code
  plinkr::create_assoc_data(
    data = create_plink_text_data(
      ped_table = ped_table,
      map_table = map_table
    )
  )
}
