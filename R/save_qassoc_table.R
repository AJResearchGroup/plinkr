#' Save a \code{.qassoc} table to file.
#'
#' Save a \code{.qassoc} table to file
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
save_qassoc_table <- function(
  qassoc_table,
  qassoc_filename,
  plink_options = create_plink_options()
) {
  plinkr::check_qassoc_table(qassoc_table)
  plinkr::check_plink_options(plink_options)

  # PLINK 1.7 uses spaces
  # PLINK 1.9 uses tabs
  # Unknown what PLINK 2 uses
  seperator <- " "
  if (plink_options$plink_version == "1.9") {
    seperator <- "\t"
  }

  # A .qassoc file does have a header
  text_header_matrix <- t(as.matrix(names(qassoc_table)))
  text_body_matrix <- as.matrix(qassoc_table)
  text_matrix <- rbind(text_header_matrix, text_body_matrix)

  text_vector <- rep(NA, nrow(text_matrix))
  for (i in seq_along(text_vector)) {
    text_vector[i] <- paste0(text_matrix[i, ], collapse = seperator)
  }

  dir.create(
    path = dirname(qassoc_filename),
    showWarnings = FALSE,
    recursive = TRUE
  )

  # PLINK 1.7 example file has an added empty line
  if (plink_options$plink_version == "1.7") {
    text_vector <- c(text_vector, "")
  }


  tryCatch(
    suppressWarnings(
      readr::write_lines(x = text_vector, file = qassoc_filename)
    ),
    error = function(e) {
      stop(
        "Cannot save 'qassoc_table' to path '", qassoc_filename, "'. \n",
        "Maybe no permission to do so? \n",
        "Note that 'save_qassoc_table' will (try to) create ",
        "the (sub)folders needed. \n",
        "Error message: ", e$message
      )
    }
  )
  testthat::expect_true(file.exists(qassoc_filename))
}
