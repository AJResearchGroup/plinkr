#' Create a demo pedigree \code{.ped} table
#'
#' Create a demo pedigree \code{.ped} table,
#' which should allow the individuals to have all combinations of SNPs
#' exactly once. As we assume four nucleotides and a diploid organism,
#' these are 16 individuals.
#' @inheritParams default_params_doc
#' @export
create_demo_ped_table <- function(n_snps = 2) {
  ped_table_lhs <- tibble::tibble(
    family_id = seq_len(16),
    within_family_id = 1,
    within_family_id_father = 0,
    within_family_id_mother = 0,
    sex_code = 1,
    case_control_code = 0
  )

  nucleotides <- c("A", "C", "G", "T")
  snv_combinations <- tidyr::expand_grid(a = nucleotides, b = nucleotides)

  tibbles <- list()
  for (i in seq_len(n_snps)) {
    t <- tibble::tibble(snv_combinations)
    names(t) <- paste0("snv_", i, names(t))
    tibbles[[i]] <- t
  }
  ped_table_rhs <- dplyr::bind_cols(tibbles)
  dplyr::bind_cols(ped_table_lhs, ped_table_rhs)
}
