#' Create parameters for the \link{assoc} function
#'
#' Create parameters to detect associations with a binary traits
#' (using \link{assoc}).
#' Use \link{create_test_assoc_params}) to create a set of parameters
#' that is used in testing.
#'
#' @note This function is named after the \code{--assoc} PLINK flag.
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
create_assoc_params <- function(
  ped_table,
  map_table,
  confidence_interval = 0.95,
  maf = get_lowest_maf(),
  base_input_filename = file.path(get_plinkr_tempfilename(), "assoc_input"),
  base_output_filename = file.path(get_plinkr_tempfilename(), "assoc_output")
) {
  plinkr::check_ped_table(ped_table = ped_table)
  plinkr::check_map_table(map_table = map_table)
  plinkr::check_confidence_interval(confidence_interval = confidence_interval)
  plinkr::check_maf(maf = maf)
  plinkr::check_base_input_filename(base_input_filename = base_input_filename)
  plinkr::check_base_output_filename(base_output_filename)
  list(
    ped_table = ped_table,
    map_table = map_table,
    confidence_interval = confidence_interval,
    maf = maf,
    base_input_filename = base_input_filename,
    base_output_filename = base_output_filename
  )
}
