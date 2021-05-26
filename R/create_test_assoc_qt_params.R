#' Create testing parameters for the \link{assoc_qt} function
#'
#' Create parameters (as created by \link{create_assoc_qt_params})
#' to detect associations with quantitative traits
#' (using \link{assoc_qt}) used for testing.
#'
#' @note This function is named after the \code{--assoc-qt} PLINK flag.
#' @inheritParams default_params_doc
#' @export
create_test_assoc_qt_params <- function(
  ped_table = get_test_ped_table(),
  map_table = get_test_map_table(),
  phenotype_table = plinkr::create_phenotype_table_from_ped_table(
    ped_table = ped_table
  ),
  maf = get_lowest_maf()
) {
  plinkr::check_ped_table(ped_table = ped_table)
  plinkr::check_map_table(map_table = map_table)
  plinkr::check_phenotype_table(phenotype_table = phenotype_table)
  plinkr::check_maf(maf = maf)
  phenotype_table[, 3] <- 0.1 * seq_len(nrow(phenotype_table))
  plinkr::create_assoc_qt_params(
    ped_table = ped_table,
    map_table = map_table,
    phenotype_table = phenotype_table,
    maf = maf
  )
}
