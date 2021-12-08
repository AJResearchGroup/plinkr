#' Determine if the `plink2_bin_data` is indeed `PLINK2` binary data
#' @inheritParams default_params_doc
#' @return \link{TRUE} if the `plink2_bin_data` is indeed `PLINK2` binary data
#' @seealso `plinkr` has multiple functions to test if a type of data is valid:
#'
#'  * `PLINK` text data: use \link{is_plink_text_data}
#'  * `PLINK` binary data: use \link{is_plink_bin_data}
#'  * `PLINK2` binary data: use \link{is_plink2_bin_data}
#'  * any type of `PLINK`/`PLINK2` data: use \link{is_data}
#'  * associative trait analysis data: use \link{is_assoc_qt_data}
#'
#' @examples
#' plink2_bin_data <- create_plink2_bin_data(
#'   pgen_table = get_test_pgen_table(),
#'   psam_table = get_test_psam_table(),
#'   pvar_table = get_test_pvar_table()
#' )
#' is_plink2_bin_data(plink2_bin_data)
#' @author Richèl J.C. Bilderbeek
#' @export
is_plink2_bin_data <- function(
  plink2_bin_data
) {
  result <- FALSE
  tryCatch({
    plinkr::check_plink2_bin_data(plink2_bin_data = plink2_bin_data)
    result <- TRUE
  }, error = function(e) {} # nolint indeed ignore error
  )
  result
}
