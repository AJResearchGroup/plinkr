#' Create parameters for the \link{assoc_qt} function
#'
#' Create parameters to detect associations with quantitative traits
#' (using \link{assoc_qt}).
#' Use \link{create_test_assoc_qt_params}) to create a set of parameters
#' that is used in testing.
#'
#' @note This function is named after the \code{--assoc-qt} PLINK flag.
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
