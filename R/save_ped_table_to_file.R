#' Save a \code{.ped} table to file.
#'
#' Save a \code{.ped} table to file to be used by PLINK.
#' Most columns have a single space between them.
#' The exceptions, where there are two spaces between the columns are:
#'  * between \code{sex_code} and \code{case_control_code}
#'  * between \code{case_control_code} and the first SNP
#'  * between each pair of SNPs
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
save_ped_table_to_file <- function(
  ped_table,
  ped_filename
) {
  # A .ped file does not have a header,
  text_matrix <- as.matrix(ped_table)

  # Add extra spaces for PLINK
  # * between \code{sex_code} and \code{case_control_code}
  sex_code_index <- which(colnames(text_matrix) == "sex_code")
  testthat::expect_equal(1, length(sex_code_index)) # Must be found
  text_matrix[, sex_code_index] <- paste0(text_matrix[, sex_code_index], " ")
  # * between \code{case_control_code} and the first SNP
  case_control_code_index <- which(colnames(text_matrix) == "case_control_code")
  testthat::expect_equal(1, length(case_control_code_index)) # Must be found
  text_matrix[, case_control_code_index] <- paste0(
    text_matrix[, case_control_code_index], " "
  )
  # * between each pair of SNPs, add it to each snv_[x]b, except the last
  n_snps <- (ncol(ped_table) - 6) / 2
  if (n_snps > 1) {
    snp_b_indices <- seq(from = 8, to = 8 + ((n_snps - 2) * 2))
    text_matrix[, snp_b_indices] <- paste0(text_matrix[, snp_b_indices], " ")
  }

  text_vector <- rep(NA, nrow(text_matrix))
  for (i in seq_along(text_vector)) {
    text_vector[i] <- paste0(text_matrix[i, ], collapse = " ")
  }



  text_vector <- stringr::str_trim(text_vector)

  dir.create(
    path = dirname(ped_filename),
    showWarnings = FALSE,
    recursive = TRUE
  )

  tryCatch(
    suppressWarnings(
      readr::write_lines(x = text_vector, file = ped_filename)
    ),
    error = function(e) {
      stop(
        "Cannot save 'ped_table' to path '", ped_filename, "'. \n",
        "Maybe no permission to do so? \n",
        "Note that 'save_ped_table_to_file' will (try to) create ",
        "the (sub)folders needed. \n",
        "Error message: ", e$message
      )
    }
  )
  testthat::expect_true(file.exists(ped_filename))
}
