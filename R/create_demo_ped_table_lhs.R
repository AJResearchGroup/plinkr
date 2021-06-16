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

  # The column names FID and IID match the PLINK names of the same
  # data in the phenotype files,
  # https://www.cog-genomics.org/plink/1.9/input#pheno
  ped_table_lhs <- tibble::tibble(
    FID = seq_len(n_individuals),
    IID = 1,
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
