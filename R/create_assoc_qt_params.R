#' Create parameters for the \link{assoc_qt} function
#'
#' Create parameters to detect associations with quantitative traits
#' (using \link{assoc_qt}).
#' Use \link{create_test_assoc_qt_params}) to create a set of parameters
#' that is used in testing.
#'
#' @note This function is named after the \code{--assoc} \code{PLINK} flag.
#' Where \code{--PLINK} uses phenotypic values to determine if an association
#' is about a binary/case-control trait or a quantitative trait,
#' \link{plinkr} uses functions named \link{assoc} and \link{assoc_qt}.
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
create_assoc_qt_params <- function(
  ped_table,
  map_table,
  phe_table,
  maf = get_lowest_maf(),
  base_input_filename = file.path(get_plinkr_tempfilename(), "assoc_input"),
  base_output_filename = file.path(get_plinkr_tempfilename(), "assoc_output")
) {
  plinkr::check_ped_table(ped_table = ped_table)
  plinkr::check_map_table(map_table = map_table)
  plinkr::check_phe_table(phe_table = phe_table)
  plinkr::check_maf(maf = maf)
  plinkr::check_base_input_filename(base_input_filename = base_input_filename)
  plinkr::check_base_output_filename(base_output_filename)
  list(
    ped_table = ped_table,
    map_table = map_table,
    phe_table = phe_table,
    maf = maf,
    base_input_filename = base_input_filename,
    base_output_filename = base_output_filename
  )
}
