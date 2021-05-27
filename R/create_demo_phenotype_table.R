#' Create a demo phenotype table
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
create_demo_phenotype_table <- function(
  traits = create_demo_traits(),
  ped_table = create_demo_ped_table(traits = traits)
) {
  plinkr::check_ped_table(ped_table)
  plinkr::check_traits(traits)

  phenotype_table_lhs <- plinkr::create_demo_phenotype_table_lhs(
    ped_table = ped_table
  )
  phenotype_table_rhs <- plinkr::create_demo_phenotype_table_rhs(
    traits = traits,
    ped_table = ped_table
  )
  testthat::expect_equal(
    nrow(phenotype_table_lhs),
    nrow(phenotype_table_rhs)
  )
  dplyr::bind_cols(phenotype_table_lhs, phenotype_table_rhs)
}
