#' Create a demo pedigree \code{.ped} table
#'
#' Create a demo pedigree \code{.ped} table,
#' which should allow the individuals to have all combinations of
#' biallelic SNPs exactly once.
#' As we assume two nucleotides and a diploid organism,
#' these are 4 individuals.
#' @inheritParams default_params_doc
#' @export
create_demo_ped_table <- function(
  n_individuals = 4,
  phenotypes = get_phenotypes()
) {
  plinkr::check_n_individuals(n_individuals)
  plinkr::check_phenotypes(phenotypes)
  n_snvs <- length(phenotypes)
  ped_table_lhs <- tibble::tibble(
    family_id = seq_len(n_individuals),
    within_family_id = 1,
    within_family_id_father = 0,
    within_family_id_mother = 0,
    sex_code = 1,
    case_control_code = 0
  )
  # Convert all columns to numeric
  ped_table_lhs <- dplyr::mutate(
    dplyr::select(ped_table_lhs, dplyr::everything()),
    dplyr::across(dplyr::everything(), as.numeric)
  )

  tibbles <- list()
  for (i in seq_len(n_snvs)) {
    phenotype <- phenotypes[i]
    nucleotides <- NA
    if (phenotype == "random") {
      nucleotides <- c("A", "C")
    } else {
      testthat::expect_true(phenotype == "additive")
      nucleotides <- c("A", "T")
    }
    snv_combinations <- tidyr::expand_grid(
      a = nucleotides,
      b = nucleotides
    )
    t <- tibble::tibble(snv_combinations)
    names(t) <- paste0("snv_", i, names(t))
    tibbles[[i]] <- t
  }
  ped_table_rhs <- dplyr::bind_cols(tibbles)

  testthat::expect_equal(nrow(ped_table_lhs), nrow(ped_table_rhs))
  dplyr::bind_cols(ped_table_lhs, ped_table_rhs)
}
