#' Create a table with single nucleotide variants (SNVs)
#'
#' Create a table with single nucleotide variants (SNVs),
#' in the form of a \link[tibble]{tibble} that contains the
#' two nucleotide calls for multiple individuals.
#' Each individual is represented by a row.
#' The first two columns are named \code{snv_1a}, \code{snv_1b} and
#' hold the genetic data for the first SNV of a diploid organism.
#' If there are more SNVs, columns continue with names,
#' \code{snv_2a}, \code{snv_2b}, \code{snv_3a}, \code{snv_3b}, etc.
#' In general, nucleotides are in uppercase.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if the input
#' \code{calc_phenotype_function} is invalid
#' @author Richèl J.C. Bilderbeek
#' @export
create_snvs <- function(
  n_snps = 1,
  n_individuals = 1
) {
  if (n_snps == 1) {
    return(
      tidyr::expand_grid(
        snv_1a = c("A", "C"),
        snv_1b = c("A", "C")
      )[seq(1, n_individuals), ]
    )
  }
  if (n_snps == 2) {
    return(
      tidyr::expand_grid(
        snv_1a = c("A", "C"),
        snv_1b = c("A", "C"),
        snv_2a = c("A", "C"),
        snv_2b = c("A", "C")
      )[seq(1, n_individuals), ]
    )
  }
  m <- matrix(data = "A", nrow = n_individuals, ncol = n_snps * 2)
  t <- tibble::as_tibble(m, .name_repair = "minimal")
  names(t) <- paste0(
    "snv_",
    rep(seq(from = 1, to = ncol(t) / 2), each = 2),
    rep(c("a", "b"), times = ncol(t) / 2)
  )
  t
}
