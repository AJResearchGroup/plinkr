#' Internal function
#'
#' Internal function to create the left-hand side
#' of a phenotype table
#' @inheritParams default_params_doc
#' @examples
#' create_demo_phenotype_table_lhs()
#' create_demo_phenotype_table_lhs(get_test_ped_table())
#' @author Richèl J.C. Bilderbeek
#' @export
create_demo_phenotype_table_lhs <- function(
  ped_table = create_demo_ped_table()
) {
  ped_table[, c(1, 2)]
}
