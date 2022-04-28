#' Create a demo genetic mapping \code{.map} table
#'
#' Create a demo genetic mapping \code{.map} table.
#' It is simply a map of SNPs that are located on different chromosomes.
#'
#' Each SNP is positioned on a different chromosome.
#' As PLINK allows for a maximum of 95 chromosomes,
#' the 96th SNP is placed on the first chromosome again,
#' after which the chromosomes are travered again.
#' @inheritParams default_params_doc
#' @examples
#' # Default demonstration genetic mapping table
#' create_demo_map_table()
#'
#' # Random, 1 SNP
#' create_demo_map_table(traits = create_random_trait())
#'
#' # Random, 2 SNPs
#' create_demo_map_table(traits = create_random_trait(n_snps = 2))
#' @author Richèl J.C. Bilderbeek
#' @export
create_demo_map_table <- function(
  traits = create_demo_traits()
) {
  plinkr::check_traits(traits)

  # traits must be a list of traits
  if (plinkr::is_one_trait(traits)) traits <- list(traits)
  testthat::expect_false(plinkr::is_one_trait(traits))

  n_snps <- sum(purrr::map_dbl(traits, function(e) e$n_snps))
  testthat::expect_true(n_snps > 0)
  tibble::tibble(
    CHR = 1 + (seq(0, n_snps - 1) %% 95),
    SNP = paste0("snp_", seq_len(n_snps)),
    position_cm = rep(0, n_snps),
    BP = seq_len(n_snps)
  )
}
