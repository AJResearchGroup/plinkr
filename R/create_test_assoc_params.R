#' Create testing parameters for the \link{assoc} function
#'
#' Create parameters (as created by \link{create_assoc_params})
#' to detect associations with quantitative traits
#' (using \link{assoc}) used for testing.
#'
#' @note This function is named after the \code{--assoc} PLINK flag.
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_assoc_params <- function(
  ped_table = get_test_ped_table(),
  map_table = get_test_map_table(),
  maf = get_lowest_maf()
) {
  plinkr::check_ped_table(ped_table = ped_table)
  plinkr::check_map_table(map_table = map_table)
  plinkr::check_maf(maf = maf)
  plinkr::create_assoc_params(
    ped_table = ped_table,
    map_table = map_table,
    maf = maf
  )
}
