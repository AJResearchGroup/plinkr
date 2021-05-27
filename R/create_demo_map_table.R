#' Create a demo genetic mapping \code{.map} table
#'
#' Create a demo genetic mapping \code{.map} table.
#' It is simply a map of SNPs that are located on different chromosomes.
#' @inheritParams default_params_doc
#' @examples
#' create_demo_map_table()
#' @author Richèl J.C. Bilderbeek
#' @export
create_demo_map_table <- function(
  traits = create_demo_traits()
) {
  plinkr::check_traits(traits)

  # traits must be a list of traits
  if (plinkr::is_one_trait(traits)) traits <- list(traits)
  testthat::expect_false(plinkr::is_one_trait(traits))

  phenotypes <- purrr::map_chr(traits, function(e) e$phenotype)
  snps_per_phenotype <- rep(1, length(phenotypes))
  snps_per_phenotype[phenotypes == "epistatic"] <- 2
  n_snps <- sum(snps_per_phenotype)

  tibble::tibble(
    CHR = seq_len(n_snps),
    SNP = paste0("snp_", seq_len(n_snps)),
    position_cm = rep(0, n_snps),
    BP = seq_len(n_snps)
  )
}
