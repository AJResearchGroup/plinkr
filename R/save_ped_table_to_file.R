#' Save a \code{.ped} table to file
#' @inheritParams default_params_doc
#' @export
save_ped_table_to_file <- function(
  ped_table,
  ped_filename
) {
  # A .ped file does not have a header,
  text_matrix <- as.matrix(ped_table)
  text_vector <- rep(NA, nrow(text_matrix))
  for (i in seq_along(text_vector)) {
    text_vector[i] <- paste0(text_matrix[i, ], collapse = " ")
  }

  dir.create(
    path = dirname(ped_filename),
    showWarnings = FALSE,
    recursive = TRUE
  )

  readr::write_lines(x = text_vector, file = ped_filename)

  testthat::expect_true(file.exists(ped_filename))

}
