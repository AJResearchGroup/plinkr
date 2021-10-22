#' Convert `PLINK` data to a `PLINK` `.ped` table
#'
#' Convert `PLINK` data to a `PLINK` `.ped` table
#' @inheritParams default_params_doc
#' @return a `PLINK` `.ped` table
#' @author Richèl J.C. Bilderbeek
#' @export
convert_plink_bin_data_to_ped_table <- function( # nolint indeed a long function name
  plink_bin_data,
  verbose = FALSE
) {
  plinkr::check_plink_bin_data(plink_bin_data)
  ped_table_lhs <- tibble::tibble(
    FID = plink_bin_data$fam_table$fam,
    IID = plink_bin_data$fam_table$id,
    within_family_id_father = plink_bin_data$fam_table$pat,
    within_family_id_mother = plink_bin_data$fam_table$mat,
    sex_code = plink_bin_data$fam_table$sex,
    case_control_code = plink_bin_data$fam_table$pheno
  )
  n_snps <- nrow(plink_bin_data$bim_table)
  snv_names <- paste0(
    "snv_",
    rep(seq(from = 1, to = n_snps), each = 2),
    rep(c("a", "b"), times = n_snps)
  )
  ped_table_rhs <- tibble::as_tibble(
    matrix(
      NA,
      nrow = nrow(ped_table_lhs),
      ncol = length(snv_names)
    ),
    .name_repair = "minimal"
  )
  colnames(ped_table_rhs) <- snv_names

  ped_table <- dplyr::bind_cols(ped_table_lhs, ped_table_rhs)

  plinkr::check_ped_table(ped_table)
  ped_table
}
