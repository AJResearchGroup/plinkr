#' Create parameters for the \link{assoc_qt} function
#' @inheritParams default_params_doc
#' @export
create_assoc_qt_params <- function(
  ped_table,
  map_table,
  phenotype_table,
  maf
) {
  list(
    ped_table = ped_table,
    map_table = map_table,
    phenotype_table = phenotype_table,
    maf = maf
  )
}
