#' Create a demo pedigree \code{.ped} table
#'
#' Create a demo pedigree \code{.ped} table
#' @inheritParams default_params_doc
#' @examples
#' create_demo_ped_table()
#' @author Richèl J.C. Bilderbeek
#' @export
create_demo_ped_table <- function(
  n_individuals = 4,
  traits = create_demo_traits()
) {
  # Input is checked by create_demo_ped_table_lhs
  # and create_demo_ped_table_rhs
  ped_table_lhs <- plinkr::create_demo_ped_table_lhs(
    n_individuals = n_individuals
  )
  ped_table_rhs <- plinkr::create_demo_ped_table_rhs(
    n_individuals = n_individuals,
    traits = traits
  )
  testthat::expect_equal(nrow(ped_table_lhs), nrow(ped_table_rhs))
  dplyr::bind_cols(ped_table_lhs, ped_table_rhs)
}
