#' Create a set of \code{assoc_qt_covar} parameters
#' to demonstrate PLINKs \code{--assoc} and \code{--covar} functionality
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
#' @note This function is named after the \code{--assoc}
#' and \code{--covar} PLINK flags.
#' @examples
#' # Default
#' create_demo_assoc_qt_covar_params()
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
create_demo_assoc_qt_covar_params <- function( # nolint indeed a long function name
  n_individuals = 3,
  traits = create_demo_traits()
) {
  plinkr::check_n_individuals(n_individuals)
  plinkr::check_traits(traits)

  # Add a demo covariates table to the
  assoc_qt_data <- create_demo_assoc_qt_data(
    n_individuals = n_individuals,
    traits = traits
  )

  cov_table <- plinkr::create_cov_table_from_ped_table(
    assoc_qt_data$data$ped_table
  )
  cov_table[, 3] <- stats::runif(n = nrow(cov_table))
  plinkr::create_assoc_qt_covar_params(
    data = create_plink_text_data(
      ped_table = assoc_qt_data$data$ped_table,
      map_table = assoc_qt_data$data$map_table
    ),
    phe_table = assoc_qt_params$phe_table,
    cov_table = cov_table
  )
}
