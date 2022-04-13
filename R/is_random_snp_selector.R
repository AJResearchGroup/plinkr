#' Determine if this is a random SNP selector
#'
#' Determine if this is a random SNP selector
#' @inheritParams default_params_doc
#' @return \link{TRUE} if this is a random SNP selector
#' @examples
#' is_random_snp_selector(create_test_random_snp_selector())
#'
#' is_random_snp_selector("nonsense")
#' @author Richèl J.C. Bilderbeek
#' @export
is_random_snp_selector <- function(
  random_snp_selector,
  verbose = FALSE
) {
  plinkr::check_verbose(verbose)
  result <- FALSE
  tryCatch({
    plinkr::check_random_snp_selector(random_snp_selector = random_snp_selector)
    result <- TRUE
  }, error = function(e) {
    if (verbose) message(e$message)
  }
  )
  result
}
