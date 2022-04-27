#' Determine if this is a random SNPs selector
#'
#' Determine if this is a random SNPs selector
#' @inheritParams default_params_doc
#' @return \link{TRUE} if this is a random SNP selector
#' @examples
#' is_random_snps_selector(create_test_random_snps_selector())
#'
#' is_random_snps_selector("nonsense")
#' @author Richèl J.C. Bilderbeek
#' @export
is_random_snps_selector <- function(
  random_snps_selector,
  verbose = FALSE
) {
  plinkr::check_verbose(verbose)
  result <- FALSE
  tryCatch({
    plinkr::check_random_snps_selector(
      random_snps_selector = random_snps_selector
    )
    result <- TRUE
  }, error = function(e) {
    if (verbose) message(e$message)
  }
  )
  result
}
