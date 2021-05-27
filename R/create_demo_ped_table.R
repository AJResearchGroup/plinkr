#' Create a demo pedigree \code{.ped} table
#'
#' Create a demo pedigree \code{.ped} table,
#' which should allow the individuals to have all combinations of
#' biallelic SNPs exactly once.
#' As we assume two nucleotides and a diploid organism,
#' these are 4 individuals.
#' @inheritParams default_params_doc
#' @examples
#' create_demo_ped_table()
#' @author Richèl J.C. Bilderbeek
#' @export
create_demo_ped_table <- function(
  n_individuals = 4,
  traits = create_demo_traits()
) {
  plinkr::check_n_individuals(n_individuals)
  plinkr::check_traits(traits)

  # traits must be a list of traits
  if (plinkr::is_one_trait(traits)) traits <- list(traits)
  testthat::expect_false(plinkr::is_one_trait(traits))

  # Don't be smart yet
  phenotypes <- purrr::map_chr(traits, function(e) e$phenotype)
  mafs <- purrr::map_dbl(traits, function(e) e$maf)

  plinkr::check_phenotypes(phenotypes)
  testthat::expect_equal(length(phenotypes), length(mafs))
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
    # The first nucleotide will be the common/major allele
    nucleotides <- NA
    if (phenotype == "random") {
      nucleotides <- c("A", "C")
    } else {
      testthat::expect_true(phenotype == "additive")
      nucleotides <- c("A", "T")
    }
    major_allele_frequency <- 1.0 - mafs[i]
    n_major_alleles <- round(n_individuals * major_allele_frequency)
    n_minor_alleles <- n_individuals - n_major_alleles
    testthat::expect_equal(
      n_major_alleles + n_minor_alleles,
      n_individuals
    )
    nsp_calls <- c(
      rep(nucleotides[1], n_major_alleles),
      rep(nucleotides[2], n_minor_alleles)
    )
    t <- tibble::tibble(
      a = sample(nsp_calls),
      b = sample(nsp_calls)
    )
    names(t) <- paste0("snv_", i, names(t))
    tibbles[[i]] <- t
  }
  ped_table_rhs <- dplyr::bind_cols(tibbles)

  testthat::expect_equal(nrow(ped_table_lhs), nrow(ped_table_rhs))
  dplyr::bind_cols(ped_table_lhs, ped_table_rhs)
}
