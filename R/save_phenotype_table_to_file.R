#' Save a \code{.phenotype} table to file
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
save_phenotype_table_to_file <- function(
  phenotype_table,
  phenotype_filename
) {
  # A .phenotype file does not have a header,
  text_matrix <- as.matrix(phenotype_table)
  text_vector <- rep(NA, nrow(text_matrix))
  for (i in seq_along(text_vector)) {
    text_vector[i] <- paste0(text_matrix[i, ], collapse = " ")
  }

  dir.create(
    path = dirname(phenotype_filename),
    showWarnings = FALSE,
    recursive = TRUE
  )

  readr::write_lines(x = text_vector, file = phenotype_filename)
  testthat::expect_true(file.exists(phenotype_filename))
}
