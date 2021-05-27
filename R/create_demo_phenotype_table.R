#' Create a demo phenotype table
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
create_demo_phenotype_table <- function(
  traits = create_demo_traits(),
  ped_table = create_demo_ped_table(traits = traits)
) {
  plinkr::check_ped_table(ped_table)
  plinkr::check_traits(traits)

  # traits must be a list of traits
  if (plinkr::is_one_trait(traits)) traits <- list(traits)
  testthat::expect_false(plinkr::is_one_trait(traits))

  # Don't be smart yet
  phenotypes <- purrr::map_chr(traits, function(e) e$phenotype)
  plinkr::check_phenotypes(phenotypes)


  # Allow multiple columns with random
  n_randoms <- sum(phenotypes == "random")
  if (n_randoms > 1) {
    phenotypes[which(phenotypes == "random")] <-
      paste0("random_", seq_len(n_randoms))
  }

  phenotype_table <- ped_table[, 1:2]
  for (i in seq_along(phenotypes)) {
    phenotype <- phenotypes[i]
    if (stringr::str_detect(phenotype, "random")) {
      `:=` <- NULL # nolint use that tidyverse global variable here :-)
      phenotype_table <- tibble::add_column(
        phenotype_table,
        "{phenotype}" := stats::runif(nrow(phenotype_table)) # nolint the variable name indeed is funky here
      )

    } else {
      testthat::expect_equal(phenotype, "additive")
      snp_col_index_a <- 6 + ((i - 1) * 2) + 1
      testthat::expect_true(snp_col_index_a > 6)
      snp_col_index_b <- snp_col_index_a + 1
      testthat::expect_true(snp_col_index_b <= ncol(ped_table))
      phenotype_table$additive <- calc_additive_phenotype_values(
        ped_table[, c(snp_col_index_a, snp_col_index_b)]
      )
    }
  }
  phenotype_table
}
