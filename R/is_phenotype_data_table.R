#' Determine if the `phenotype_data_table` is
#' indeed phenotypic data as a \link[tibble]{tibble}
#'
#' Determine if the `phenotype_data_table` is
#' indeed phenotypic data as a \link[tibble]{tibble}
#' @inheritParams default_params_doc
#' @return \link{TRUE} if if the `phenotype_data_table` is
#' indeed phenotypic data as a \link[tibble]{tibble}
#' @author Richèl J.C. Bilderbeek
#' @export
is_phenotype_data_table <- function(
  phenotype_data_table,
  verbose = FALSE
) {
  plinkr::check_verbose(verbose)
  result <- FALSE
  tryCatch({
    plinkr::check_phenotype_data_table(
      phenotype_data_table = phenotype_data_table
    )
    result <- TRUE
  }, error = function(e) {
    if (verbose) message(e$message)
  }
  )
  result
}
