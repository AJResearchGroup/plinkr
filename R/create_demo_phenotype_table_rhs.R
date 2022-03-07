#' Internal function
#'
#' Internal function to create the right-hand side
#' of a phenotype table
#' @inheritParams default_params_doc
#' @examples
#' create_demo_phe_table_rhs()
#' create_demo_phe_table_rhs(create_random_trait())
#' create_demo_phe_table_rhs(create_additive_trait())
#' create_demo_phe_table_rhs(create_epistatic_trait())
#' @author Richèl J.C. Bilderbeek
#' @export
create_demo_phe_table_rhs <- function( # nolint indeed a long function name
  traits = create_demo_traits(),
  ped_table = create_demo_ped_table(traits = traits)
) {
  plinkr::check_traits(traits)
  plinkr::check_ped_table(ped_table)

  # traits must be a list of traits
  if (plinkr::is_one_trait(traits)) traits <- list(traits)
  testthat::expect_false(plinkr::is_one_trait(traits))

  tibbles <- list()


  testthat::expect_true(ncol(ped_table == 6) || "snv_1a" == names(ped_table)[7])
  ped_col_from <- 7
  for (i in seq_along(traits)) {
    trait <- traits[[i]]
    if (trait$n_snps == 0) next
    plinkr::check_phenotypes(trait$phenotype)
    ped_col_to <- ped_col_from + 1 + ((trait$n_snps - 1) * 2)
    testthat::expect_true(ped_col_to <= ncol(ped_table))
    snvs <- ped_table[, seq(from = ped_col_from, to = ped_col_to)]
    values <- trait$calc_phenotype_function(snvs = snvs)
    testthat::expect_equal(length(values), nrow(ped_table))
    tibbles[[i]] <- tibble::as_tibble_col(values)
    ped_col_from <- ped_col_to + 1
  }
  # ped_col_from must nicely end 1 spot beyond the last column
  testthat::expect_equal(ped_col_from, ncol(ped_table) + 1)

  phe_table_rhs <- dplyr::bind_cols(tibbles, .name_repair = "minimal")
  if (ncol(phe_table_rhs) == 0) {
    return(phe_table_rhs)
  }

  # Allow multiple columns with same phenotype
  col_names <- purrr::map_chr(traits, function(e) e$phenotype)
  for (phenotype in get_phenotypes()) {
    n_randoms <- sum(col_names == phenotype)
    if (n_randoms > 1) {
      col_names[which(col_names == phenotype)] <-
        paste0(phenotype, "_", seq_len(n_randoms))
    }
    names(phe_table_rhs) <- col_names
  }
  phe_table_rhs
}
