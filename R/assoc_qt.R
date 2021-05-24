#' Let PLINK detect an association with a quantitative trait
#'
#' This function is named after the \code{--assoc} flag used by PLINK
#' @inheritParams default_params_doc
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
