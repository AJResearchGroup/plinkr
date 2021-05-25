#' Create a demo phenotype table
#' @inheritParams default_params_doc
#' @export
create_demo_phenotype_table <- function(
  ped_table = create_demo_ped_table(get_phenotypes()),
  phenotypes = get_phenotypes()
) {
  plinkr::check_ped_table(ped_table)
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
