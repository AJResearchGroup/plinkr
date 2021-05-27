#' Internal function
#'
#' Internal function to create the right-hand side
#' of a phenotype table
#' @inheritParams default_params_doc
#' @examples
#' create_demo_phenotype_table_rhs()
#' create_demo_phenotype_table_rhs(get_test_ped_table())
#' @author Richèl J.C. Bilderbeek
#' @export
create_demo_phenotype_table_rhs <- function(
  traits = create_demo_traits(),
  ped_table = create_demo_ped_table(traits = traits)
) {
  plinkr::check_traits(traits)
  plinkr::check_ped_table(ped_table)

  # traits must be a list of traits
  if (plinkr::is_one_trait(traits)) traits <- list(traits)
  testthat::expect_false(plinkr::is_one_trait(traits))

  tibbles <- list()
  testthat::expect_equal("snv_1a", names(ped_table)[7])
  ped_col_from <- 7
  for (i in seq_along(traits)) {
    trait <- traits[[i]]
    plinkr::check_phenotypes(trait$phenotype)

    ped_col_to <- NA
    if (trait$phenotype == "random") ped_col_to <- ped_col_from + 1
    if (trait$phenotype == "additive") ped_col_to <- ped_col_from + 1
    if (trait$phenotype == "epistatic") ped_col_to <- ped_col_from + 3
    testthat::expect_true(!is.na(ped_col_to))
    snvs <- ped_table[, c(ped_col_from, ped_col_to)]
    values <- NA
    if (trait$phenotype == "random") {
       values <- plinkr::calc_random_phenotype_values(snvs = snvs)
    } else if (trait$phenotype == "additive") {
      values <- plinkr::calc_additive_phenotype_values(snvs = snvs)
    } else {
      testthat::expect_equal(trait$phenotype, "epistatic")
      values <- plinkr::calc_epistatic_phenotype_values(snvs = snvs)
    }
    tibbles[[i]] <- tibble::as_tibble_col(values)
    ped_col_from <- ped_col_to + 1
  }
  # ped_col_from must nicely end 1 spot beyond the last column
  testthat::expect_equal(ped_col_from, ncol(ped_table) + 1)

  phenotype_table_rhs <- dplyr::bind_cols(tibbles, .name_repair = "minimal")

  # Allow multiple columns with random
  phenotypes <- purrr::map_chr(traits, function(e) e$phenotype)
  n_randoms <- sum(phenotypes == "random")
  if (n_randoms > 1) {
    phenotypes[which(phenotypes == "random")] <-
      paste0("random_", seq_len(n_randoms))
  }
  names(phenotype_table_rhs) <- phenotypes
  phenotype_table_rhs
}
