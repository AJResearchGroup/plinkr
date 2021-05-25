#' Save a \code{.map} table to file.
#'
#' Save a \code{.map} table to file
#' @inheritParams default_params_doc
#' @export
save_map_table_to_file <- function(
  map_table,
  map_filename
) {
  # A .map file does not have a header,
  text_matrix <- as.matrix(map_table)
  text_vector <- rep(NA, nrow(text_matrix))
  for (i in seq_along(text_vector)) {
    text_vector[i] <- paste0(text_matrix[i, ], collapse = " ")
  }

  dir.create(
    path = dirname(map_filename),
    showWarnings = FALSE,
    recursive = TRUE
  )

  # PLINKs example files have an added empty line
  readr::write_lines(
    x = c(text_vector, ""),
    file = map_filename
  )
  testthat::expect_true(file.exists(map_filename))
}
