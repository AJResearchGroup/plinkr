#' Let PLINK detect an association with one ore more quantitative traits.
#'
#' This function assumes \code{n} traits for \code{n} SNPs,
#' and will do a separate association between each trait-SNPs pair,
#' i.e. it will detect an association based one the first trait
#' and its first set of SNPs, then do a new association between
#' the second trait and its second set of SNPs, etc.
#'
#' @note This function is named after the \code{--assoc} flag used by PLINK
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} with the following columns:
#'
#'   * \code{trait_name}: name of the quantitive trait,
#'     taken from the phenotype table column name
#'   * \code{CHR}: Chromosome number
#'   * \code{SNP}: SNP identifier
#'   * \code{BP}: Physical position (base-pair)
#'   * \code{NMISS}: Number of non-missing genotypes
#'   * \code{BETA}: Regression coefficient
#'   * \code{SE}: Standard error
#'   * \code{R2}: Regression r-squared
#'   * \code{T}: Wald test (based on t-distribution)
#'   * \code{P}: Wald test asymptotic p-value
#'
#' The table with have as much rows as the number of SNPs multiplied
#' by the number of traits.
#'
#' Note that parameters in uppercase are named as such by PLINK.
#' @examples
#' if (is_plink_installed()) {
#'   assoc_qt(create_demo_assoc_qt_params())
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
assoc_qt <- function(
  assoc_qt_params,
  verbose = FALSE
) {
  plinkr::check_assoc_qt_params(assoc_qt_params)
  n_traits <- ncol(assoc_qt_params$phenotype_table) - 2

  tibbles <- list()
  for (n in seq_len(n_traits)) {
    t <- plinkr::assoc_qt_nth_trait(
      assoc_qt_params = assoc_qt_params,
      n = n,
      verbose = verbose
    )
    t$trait_name <- names(assoc_qt_params$phenotype_table[2 + n])
    trait_name <- NULL # nolint suppress 'no visible binding for global variable'
    t <- dplyr::relocate(t, trait_name)
    tibbles[[n]] <- t
  }
  dplyr::bind_rows(tibbles)
}
