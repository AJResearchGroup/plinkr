#' Let PLINK detect an association with a quantitative trait
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
#'   * \code{T}: Wald test (based on t-distribtion)
#'   * \code{P}: Wald test asymptotic p-value
#'
#' The table with have as much rows as the number of SNPs multiplied
#' by the number of traits.
#'
#' Note that parameters in uppercase are named as such by PLINK.
#' @export
assoc_qt <- function(
  assoc_qt_params
) {
  n_traits <- ncol(assoc_qt_params$phenotype_table) - 2

  tibbles <- list()
  for (i in seq_len(n_traits)) {
    t <- plinkr::assoc_qt_nth_trait(
      assoc_qt_params = assoc_qt_params,
      n = i
    )
    t$trait_name <- names(assoc_qt_params$phenotype_table[2 + i])
    trait_name <- NULL # nolint suppress 'no visible binding for global variable'
    t <- dplyr::relocate(t, trait_name)
    tibbles[[i]] <- t
  }
  dplyr::bind_rows(tibbles)
}
