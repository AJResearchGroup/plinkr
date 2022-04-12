#' Check if SNP selector is valid.
#'
#' Check if SNP selector is valid.
#' Will \link{stop} if not.
#'
#' @inheritParams default_params_doc
#' @return Nothing.
#' @seealso
#'
#' There are multiple SNP selector checking functions:
#'
#'  * general, any type: see \link{check_snp_selector}
#'  * a single SNP: see \link{check_single_snp_selector}
#'  * a SNP range: see \link{check_snp_range_selector}
#'  * a window around a SNP: see \link{check_snp_window_selector}
#' @examples
#' # A SNP window selector
#' check_snp_selector(create_test_snp_window_selector())
#'
#' # Other types of SNP selectors ...
#' @author Richèl J.C. Bilderbeek
#' @export
check_snp_selector <- function(snp_selector) {
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
