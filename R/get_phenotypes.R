#' Get the phenotypes that are named after their genetic background
#'
#' Get the phenotypes that are named after their genetic background
#'
#' To create a trait with a phenotype:
#'
#' * \link{create_additive_trait}
#' * \link{create_custom_trait}
#' * \link{create_dominant_trait}
#' * \link{create_epistatic_trait}
#' * \link{create_random_trait}
#' * \link{create_random_case_control_trait}
#' * \link{create_rnorm_trait}
#' * \link{create_runif_trait}
#'
#' The functions that calculate the phenotype for a genotype:
#'
#' * \link{calc_additive_phenotype_values}
#' * \link{calc_dominant_phenotype_values}
#' * \link{calc_epistatic_phenotype_values}
#' * \link{calc_random_phenotype_values}
#' * \link{calc_random_case_control_phenotype_values}
#' * \link{calc_rnorm_phenotype_values}
#' * \link{calc_runif_phenotype_values}
#'
#' @return all the phenotypes that are named after their genetic background
#' @note The function has the word \code{get} in its name,
#' as getting the result is trivial. When getting the result is non-trivial,
#' the word \code{create} is used.
#' @author Richèl J.C. Bilderbeek
#' @export
get_phenotypes <- function() {
  c(
    "additive",
    "custom",
    "dominant",
    "epistatic",
    "random",
    "random_case_control",
    "rnorm",
    "runif"
  )
}
