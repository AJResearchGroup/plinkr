#' Save a \code{.phenotype} table to file
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
save_phenotype_table_to_file <- function(
  phenotype_table,
  phenotype_filename
) {
  # A .phenotype file does not have a header
  text_matrix_header <- t(as.matrix(names(phenotype_table)))
  text_matrix_body <- as.matrix(phenotype_table)
  text_matrix <- rbind(text_matrix_header, text_matrix_body)
  text_vector <- rep(NA, nrow(text_matrix))
  for (i in seq_along(text_vector)) {
    text_vector[i] <- paste0(text_matrix[i, ], collapse = " ")
  }

  dir.create(
    path = dirname(phenotype_filename),
    showWarnings = FALSE,
    recursive = TRUE
  )
  # No tryCatch as no error is thrown on Windows
  try(
    suppressWarnings(
      readr::write_lines(x = text_vector, file = phenotype_filename)
    )
  )
  if (!file.exists(phenotype_filename)) {
    stop(
      "Cannot save 'phenotype_table' to path '", phenotype_filename, "'. \n",
      "Maybe no permission to do so? \n",
      "Note that 'save_phenotype_table_to_file' will (try to) create ",
      "the (sub)folders needed."
    )
  }
}
