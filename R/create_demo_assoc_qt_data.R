#' Create a set of \link{assoc_qt} data
#' to demonstrate PLINKs \code{--assoc_qt} functionality
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
#' @examples
#' # Default
#' create_demo_assoc_qt_data()
#'
#' # Add more individuals
#' create_demo_assoc_qt_data(n_individuals = 5)
#'
#' # Use a random trait
#' create_demo_assoc_qt_data(
#'   traits = create_random_trait()
#' )
#'
#' # Use an additive trait
#' create_demo_assoc_qt_data(
#'   traits = create_additive_trait()
#' )
#'
#' # Use an epistatic trait
#' create_demo_assoc_qt_data(
#'   traits = create_epistatic_trait()
#' )
#'
#' # Use an additive and random trait
#' create_demo_assoc_qt_data(
#'   traits = list(
#'     create_additive_trait(),
#'     create_random_trait()
#'    )
#' )
#'
#' # Use three random traits
#' # Don't forget to put the trait in a list, else 'rep' will
#' # concatenate the traits in one list
#' create_demo_assoc_qt_data(
#'   traits = rep(list(create_random_trait()), 3)
#' )
#'
#' # Use two additive traits with different minor allele frequencies
#' create_demo_assoc_qt_data(
#'   traits = list(
#'     create_additive_trait(maf = 0.01),
#'     create_additive_trait(maf = 0.10)
#'   )
#' )
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
create_demo_assoc_qt_data <- function(
  n_individuals = 3,
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
    traits = traits
  )
  phe_table <- create_demo_phe_table(
    ped_table = ped_table,
    traits = traits
  )
  phenotype_data <- create_phenotype_data_table(
    phe_table = phe_table
  )

  plinkr::create_assoc_qt_data(
    data = create_plink_text_data(
      ped_table = ped_table,
      map_table = map_table
    ),
    phenotype_data = phenotype_data
  )
}
