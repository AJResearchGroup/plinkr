#' Save a \code{.map} table to file.
#'
#' Save a \code{.map} table to file
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
save_map_table_to_file <- function(
  map_table,
  map_filename,
  plink_options = create_plink_options()
) {
  plinkr::check_map_table(map_table)
  plinkr::check_plink_options(plink_options)

  # PLINK 1.7 uses spaces
  # PLINK 1.9 uses tabs
  # Unknown what PLINK 2 uses
  seperator <- " "
  if (plink_options$plink_version == "1.9") {
    seperator <- "\t"
  }

  # A .map file does not have a header
  text_matrix <- as.matrix(map_table)
  text_vector <- rep(NA, nrow(text_matrix))
  for (i in seq_along(text_vector)) {
    text_vector[i] <- paste0(text_matrix[i, ], collapse = seperator)
  }

  dir.create(
    path = dirname(map_filename),
    showWarnings = FALSE,
    recursive = TRUE
  )

  # PLINK 1.7 example file has an added empty line
  if (plink_options$plink_version == "1.7") {
    text_vector <- c(text_vector, "")
  }


  tryCatch(
    suppressWarnings(
      readr::write_lines(x = text_vector, file = map_filename)
    ),
    error = function(e) {
      stop(
        "Cannot save 'map_table' to path '", map_filename, "'. \n",
        "Maybe no permission to do so? \n",
        "Note that 'save_map_table_to_file' will (try to) create ",
        "the (sub)folders needed. \n",
        "Error message: ", e$message
      )
    }
  )
  testthat::expect_true(file.exists(map_filename))
}
