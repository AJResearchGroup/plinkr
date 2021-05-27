#' Internal function
#'
#' Internal function to create the left-hand side
#' of a demo pedigree \code{.ped} table
#' @inheritParams default_params_doc
#' @examples
#' create_demo_ped_table_lhs()
#' create_demo_ped_table_lhs(n_individuals = 4)
#' @author Richèl J.C. Bilderbeek
#' @export
create_demo_ped_table_lhs <- function(
  n_individuals = 4
) {
  plinkr::check_n_individuals(n_individuals)
  ped_table_lhs <- tibble::tibble(
    family_id = seq_len(n_individuals),
    within_family_id = 1,
    within_family_id_father = 0,
    within_family_id_mother = 0,
    sex_code = 1,
    case_control_code = 0
  )
  # Convert all columns to numeric
  dplyr::mutate(
    dplyr::select(ped_table_lhs, dplyr::everything()),
    dplyr::across(dplyr::everything(), as.numeric)
  )
}
