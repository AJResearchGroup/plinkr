#' Internal function
#'
#' Internal function to create the right-hand side
#' of a phenotype table
#' @inheritParams default_params_doc
#' @examples
#' create_demo_phenotype_table_rhs()
#' create_demo_phenotype_table_rhs(create_random_trait())
#' create_demo_phenotype_table_rhs(create_additive_trait())
#' create_demo_phenotype_table_rhs(create_epistatic_trait())
#' @author Richèl J.C. Bilderbeek
#' @export
create_demo_phenotype_table_rhs <- function( # nolint indeed a long function name
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
    testthat::expect_true(ped_col_to <= ncol(ped_table))
    snvs <- ped_table[, seq(from = ped_col_from, to = ped_col_to)]
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

  # Allow multiple columns with same phenotype
  if (1 == 1) {
    col_names <- purrr::map_chr(traits, function(e) e$phenotype)
    for (phenotype in get_phenotypes()) {
      n_randoms <- sum(col_names == phenotype)
      if (n_randoms > 1) {
        col_names[which(col_names == phenotype)] <-
          paste0(phenotype, "_", seq_len(n_randoms))
      }
      names(phenotype_table_rhs) <- col_names
    }
  } else {
    phenotypes <- purrr::map_chr(traits, function(e) e$phenotype)
    n_randoms <- sum(phenotypes == "random")
    if (n_randoms > 1) {
      phenotypes[which(phenotypes == "random")] <-
        paste0("random_", seq_len(n_randoms))
    }
    names(phenotype_table_rhs) <- phenotypes
  }



  phenotype_table_rhs
}
