#' Create a demo phenotype table
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
create_demo_phe_table <- function(
  traits = create_demo_traits(),
  ped_table = create_demo_ped_table(traits = traits)
) {
  plinkr::check_ped_table(ped_table)
  plinkr::check_traits(traits)

  phe_table_lhs <- plinkr::create_demo_phe_table_lhs(
    ped_table = ped_table
  )
  phe_table_rhs <- plinkr::create_demo_phe_table_rhs(
    traits = traits,
    ped_table = ped_table
  )
  if (ncol(phe_table_rhs) == 2) {
    return(phe_table_lhs)
  }
  testthat::expect_equal(
    nrow(phe_table_lhs),
    nrow(phe_table_rhs)
  )
  dplyr::bind_cols(phe_table_lhs, phe_table_rhs)
}
