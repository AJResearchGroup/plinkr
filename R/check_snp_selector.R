#' Check if SNP selector is valid.
#'
#' Check if SNP selector is valid.
#' Will \link{stop} if not.
#'
#' @inheritParams default_params_doc
#' @return Nothing.
#' @seealso
#' There are multiple SNP selectors,
#' see \link{create_snp_selector} for an overview.
#'
#' There are multiple SNP selector checking functions:
#'  * A random SNP selector: \link{check_random_snp_selector}
#'  * A single SNP selector: \link{check_single_snp_selector}
#'  * A SNP range selector: \link{check_snp_range_selector}
#'  * A SNP window selector: \link{check_snp_window_selector}
#' @examples
#' check_snp_selector(create_test_random_snp_selector())
#' check_snp_selector(create_test_single_snp_selector())
#' check_snp_selector(create_test_snp_range_selector())
#' check_snp_selector(create_test_snp_window_selector())
#' @author Richèl J.C. Bilderbeek
#' @export
check_snp_selector <- function(snp_selector) {
  tryCatch({
    plinkr::check_random_snp_selector(snp_selector)
    return(invisible(snp_selector))
  }, error = function(e) {} # nolint ignore
  )
  tryCatch({
      plinkr::check_snp_window_selector(snp_selector)
      return(invisible(snp_selector))
    }, error = function(e) {} # nolint ignore
  )
  tryCatch({
    plinkr::check_single_snp_selector(snp_selector)
    return(invisible(snp_selector))
  }, error = function(e) {} # nolint ignore
  )
  tryCatch({
    plinkr::check_snp_range_selector(snp_selector)
    return(invisible(snp_selector))
  }, error = function(e) {} # nolint ignore
  )
  stop()
}
