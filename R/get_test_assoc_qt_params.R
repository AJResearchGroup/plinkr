#' Create testing parameters for the \link{assoc_qt} function
#' @inheritParams default_params_doc
#' @export
get_test_assoc_qt_params <- function(
  ped_table = get_test_ped_table(),
  map_table = get_test_map_table(),
  phenotype_table = plinkr::create_phenotype_table_from_ped_table(
    ped_table = ped_table
  )
) {
  phenotype_table$phenotype_value <- 0.1 * seq_len(nrow(phenotype_table))
  plinkr::create_assoc_qt_params(
    ped_table = ped_table,
    map_table = map_table,
    phenotype_table = phenotype_table,
    maf = 0.05
  )
}
