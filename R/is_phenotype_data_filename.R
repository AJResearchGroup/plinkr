#' Determine if the `phenotype_data_filename` is
#' indeed phenotypic data in the form of a filename
#'
#' Determine if the `phenotype_data_filename` is
#' indeed phenotypic data in the form of a filename
#' @inheritParams default_params_doc
#' @return \link{TRUE} if the `phenotype_data_filename` is
#' indeed phenotypic data in the form of a filename
#' @author Richèl J.C. Bilderbeek
#' @export
is_phenotype_data_filename <- function(
  phenotype_data_filename,
  verbose = FALSE
) {
  plinkr::check_verbose(verbose)
  result <- FALSE
  tryCatch({
    plinkr::check_phenotype_data_filename(
      phenotype_data_filename = phenotype_data_filename
    )
    result <- TRUE
  }, error = function(e) {
    if (verbose) message(e$message)
  }
  )
  result
}
